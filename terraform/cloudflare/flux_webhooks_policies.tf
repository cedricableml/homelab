resource "cloudflare_access_policy" "flux_webhook_nucs" {
  zone_id        = var.zone_id_casa
  application_id = cloudflare_access_application.app_secondary["flux-webhook"].id

  name       = "flux-webhook nucs public"
  precedence = "12"
  decision   = "bypass"

  include {
    everyone = true
  }
}

resource "cloudflare_access_policy" "flux_webhook_talos_0" {
  zone_id        = var.zone_id_casa
  application_id = cloudflare_access_application.app_casa["flux-webhook.homelab-talos-0"].id

  name       = "flux-webhook talos public"
  precedence = "11"
  decision   = "bypass"

  include {
    everyone = true
  }
}
