resource "cloudflare_access_identity_provider" "gsuite" {
  account_id = var.cloudflare_account_id
  name       = "GSuite"
  type       = "google-apps"
  config {
    client_id     = var.gsuite_client_id
    client_secret = var.gsuite_client_secret
    apps_domain   = var.email_domain
  }
}

resource "cloudflare_access_identity_provider" "pin_login" {
  account_id = var.cloudflare_account_id
  name       = "PIN login"
  type       = "onetimepin"
}
