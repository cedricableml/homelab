locals {
  apps = [
    "bazarr",
    "calibre",
    "calibre-web",
    "dizque",
    "filebrowser",
    "change-detection",
    "grafana",
    "hass",
    "k8sapi",
    "k8sdash",
    "longhorn",
    "minio",
    "nzbget",
    "plex-requests",
    "prowlarr",
    "qbittorrent",
    "radarr",
    "readarr",
    "readarr-audiobooks",
    "sonarr",
    "storage",
    "tautulli",
    "unifi",
    "vault",
    "edgerouter",
    "login",
    "dex",
#    "cloud",
  ]
}

resource "cloudflare_access_application" "app" {
  for_each = { for app in local.apps : app => app }

  zone_id                   = var.zone_id
  name                      = each.value
  domain                    = "${each.value}.${var.domain}"
  type                      = "self_hosted"
  session_duration          = "240h"
  auto_redirect_to_identity = true
}

resource "cloudflare_access_policy" "policy" {
  for_each = cloudflare_access_application.app

  zone_id        = var.zone_id
  application_id = each.value.id

  name       = "allow ${var.email_domain}"
  precedence = "10"
  decision   = "allow"

  include {
    email_domain  = [var.email_domain]
  }
}
