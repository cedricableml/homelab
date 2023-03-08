terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.1.0"
    }
    random     = {
      version = "~> 3.4.0"
    }
  }
}

provider "cloudflare" {}
