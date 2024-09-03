/*
-----------------------------------------------------------------------------------------------------------
Prequisites: configure AWS-CLI on your terminal and install latest version of terraform.
Steps to store statefile remotely
Aim: our aim is to create instance and store the state remotely
Terraform execution cycle : terraform init --> terraform plan --> terraform apply
------------------------------------------------------------------------------------------------------------
1. First cd to "setup_remote_backend" folder and execute the cycle, It will create s3 and DynamoDb, 
and it will also create a statefile locally, you can ignore this statefile.

2. Then copy the s3 bucket name which u will get after the execution, 
and replace it with "636246426151-terraform-states" in the below backend block.

3. Then cd to "remote_state_example" folder and  execute the cycle.

It will create ec2 instance and will store the statefile remotely on s3 and will lock the file using dynamoDB

*/

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"

  backend "s3" {
    bucket  = "636246426151-terraform-states"
    key     = "development/service-name.tfstate"
    encrypt = true
    region = "ap-south-1"
    dynamodb_table = "terraform-lock"
  }

}

provider "aws" {
  region = "ap-south-1"
}



