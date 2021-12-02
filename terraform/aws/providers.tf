terraform {
  required_providers {
    cloudflare = {
      source  = "hashicorp/aws"
      version = "~> 3.68.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}
