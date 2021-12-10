terraform {
  required_providers {
    cloudflare = {
      source  = "hashicorp/aws"
      version = "~> 3.69.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}
