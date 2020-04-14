terraform {
  required_providers {
    aws = ">= 2.57.0"
  }
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.region
}
