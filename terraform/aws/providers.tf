terraform {
  required_providers {
    cloudflare = {
      source  = "hashicorp/aws"
      version = "~> 3.65.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}
