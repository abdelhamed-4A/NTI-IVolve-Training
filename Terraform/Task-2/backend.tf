terraform {
  # State File shared between all Developer
  backend "s3" {
    bucket  = "ivolve-s3-buchet"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
    # Prevent Developers to modify at the same time ---> try this by opening 2-terminal
    use_lockfile = true
  }
}