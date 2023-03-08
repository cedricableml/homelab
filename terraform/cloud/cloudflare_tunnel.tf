resource "random_id" "talos-0" {
  byte_length = 40
}

resource "cloudflare_tunnel" "talos0" {
  name       = "homelab-talos-0-cloudflared"
  account_id = var.cloudflare_account_id
  secret     = random_id.talos-0.b64_std
}
