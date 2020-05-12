# Specify the provider and access credentials

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

terraform {
  backend "s3" {
    bucket = "UPDATE_BUCKET_NAME_HERE"
    region = "us-west-1"
    key = "terraform.tfstate"
  }
}

module "vpc" {
  source = "./resources/vpc"
}
