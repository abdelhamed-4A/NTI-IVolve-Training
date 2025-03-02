# Build a Serverless Application Using AWS Lambda, API Gateway, and DynamoDB

## Objective
This guide walks you through building a serverless application that uses AWS Lambda to execute code, API Gateway to expose a REST API, and DynamoDB to store data while supporting CRUD (Create, Read, Update, Delete) operations.

## Prerequisites
- AWS account with permissions for Lambda, API Gateway, and DynamoDB.
- AWS CLI installed and configured.
- Node.js and npm installed.
- IAM Role with policies for Lambda execution and DynamoDB access.
- Text editor/IDE.
- Postman or cURL for API testing.

---

## Step 1: Create a DynamoDB Table
### 1. Create the Table
```sh
aws dynamodb create-table \
  --table-name ItemsTable \
  --attribute-definitions AttributeName=ItemId,AttributeType=S \
  --key-schema AttributeName=ItemId,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST
```
### 2. Verify Table Creation
```sh
aws dynamodb list-tables
```

---

## Step 2: Write the Lambda Function
### 1. Set Up the Project
```sh
mkdir lambda-app && cd lambda-app
npm init -y
npm install aws-sdk
```
### 2. Create the Lambda Function (index.js)
```javascript
const AWS = require('aws-sdk');
const dynamo = new AWS.DynamoDB.DocumentClient();

exports.handler = async (event) => {
    const { httpMethod, body, pathParameters } = event;

    switch (httpMethod) {
        case 'POST':
            const item = JSON.parse(body);
            await dynamo.put({ TableName: 'ItemsTable', Item: item }).promise();
            return { statusCode: 201, body: JSON.stringify({ message: 'Item created!' }) };

        case 'GET':
            const itemId = pathParameters?.id;
            const result = await dynamo.get({ TableName: 'ItemsTable', Key: { ItemId: itemId } }).promise();
            return { statusCode: 200, body: JSON.stringify(result.Item) };

        case 'PUT':
            const updateData = JSON.parse(body);
            await dynamo.update({
                TableName: 'ItemsTable',
                Key: { ItemId: updateData.ItemId },
                UpdateExpression: 'set #name = :name',
                ExpressionAttributeNames: { '#name': 'Name' },
                ExpressionAttributeValues: { ':name': updateData.Name }
            }).promise();
            return { statusCode: 200, body: JSON.stringify({ message: 'Item updated!' }) };

        case 'DELETE':
            const deleteId = pathParameters?.id;
            await dynamo.delete({ TableName: 'ItemsTable', Key: { ItemId: deleteId } }).promise();
            return { statusCode: 200, body: JSON.stringify({ message: 'Item deleted!' }) };

        default:
            return { statusCode: 400, body: 'Unsupported method' };
    }
};
```
### 3. Zip the Function
```sh
zip function.zip index.js node_modules
```

---

## Step 3: Deploy the Lambda Function
### 1. Create an IAM Role for Lambda
Attach:
- AWSLambdaBasicExecutionRole
- AmazonDynamoDBFullAccess

### 2. Deploy the Function
```sh
aws lambda create-function \
  --function-name ItemsFunction \
  --runtime nodejs18.x \
  --role arn:aws:iam::<Account-ID>:role/<IAM-Role-Name> \
  --handler index.handler \
  --zip-file fileb://function.zip
```
### 3. Test the Function
```sh
aws lambda invoke --function-name ItemsFunction output.json
cat output.json
```

---

## Step 4: Set Up API Gateway
### 1. Create a REST API
```sh
aws apigateway create-rest-api --name "ItemsAPI"
```
### 2. Get API Resource ID
```sh
aws apigateway get-resources --rest-api-id <API-ID>
```
### 3. Create Resources and Methods
```sh
aws apigateway create-resource \
  --rest-api-id <API-ID> \
  --parent-id <Parent-Resource-ID> \
  --path-part items

aws apigateway put-method \
  --rest-api-id <API-ID> \
  --resource-id <Resource-ID> \
  --http-method POST \
  --authorization-type "NONE"
```
### 4. Link API Gateway to Lambda
```sh
aws apigateway put-integration \
  --rest-api-id <API-ID> \
  --resource-id <Resource-ID> \
  --http-method POST \
  --type AWS_PROXY \
  --integration-http-method POST \
  --uri "arn:aws:apigateway:<region>:lambda:path/2015-03-31/functions/arn:aws:lambda:<region>:<Account-ID>:function:ItemsFunction/invocations"
```
### 5. Deploy the API
```sh
aws apigateway create-deployment --rest-api-id <API-ID> --stage-name dev
```

---

## Step 5: Test the Application
### 1. Get the API Endpoint
```sh
echo "https://<API-ID>.execute-api.<region>.amazonaws.com/dev/items"
```
### 2. Test CRUD Operations
#### Create Item
```sh
curl -X POST -H "Content-Type: application/json" \
-d '{"ItemId":"1","Name":"TestItem"}' \
https://<API-ID>.execute-api.<region>.amazonaws.com/dev/items
```
#### Retrieve Item
```sh
curl -X GET https://<API-ID>.execute-api.<region>.amazonaws.com/dev/items/1
```
#### Update Item
```sh
curl -X PUT -H "Content-Type: application/json" \
-d '{"ItemId":"1","Name":"UpdatedItem"}' \
https://<API-ID>.execute-api.<region>.amazonaws.com/dev/items
```
#### Delete Item
```sh
curl -X DELETE https://<API-ID>.execute-api.<region>.amazonaws.com/dev/items/1
```

---

## Expected Results
1. **DynamoDB Table:** ItemsTable is created.
2. **Lambda Function:** Executes CRUD operations on the table.
3. **API Gateway:** Endpoints return correct responses for each CRUD operation:
   - **POST:** `{ "message": "Item created!" }`
   - **GET:** `{ "ItemId": "1", "Name": "TestItem" }`
   - **PUT:** `{ "message": "Item updated!" }`
   - **DELETE:** `{ "message": "Item deleted!" }`
4. **Integration:** Successfully tested using cURL/Postman.

---

