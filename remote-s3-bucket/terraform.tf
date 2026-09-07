terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }


  backend "s3" {
    bucket = "remote-s3-bucket-practice" #There should be a new bucket name For the remote backend
    key    = "dev/terraform.tfstate"
    region = "eu-west-1"
    encrypt = true
    use_lockfile = true
  }
}
