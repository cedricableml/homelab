locals {
  apps_casa = [
    {
      subdomain = "hubble"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "bazarr"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "calibre"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "calibre-web"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "grafana"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "home-assistant"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "prowlarr"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "qbittorrent"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "radarr"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "readarr"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "readarr-audiobooks"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "sonarr"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "tautulli"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "alert-manager"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "prometheus"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "jellyfin"
      type      = "self_hosted"
      gsuite    = true
    },
#    {
#      subdomain = "plex"
#      type      = "self_hosted"
#      gsuite    = true
#    },
    {
      subdomain = "zigbee2mqtt"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "nodered"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "mosquitto"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "frigate"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "sabnzbd"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "gaps"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "hass-config"
      type      = "self_hosted"
      gsuite    = true
    },
  ]
  apps_secondary = [
    {
      subdomain = "calibre-web"
      type      = "self_hosted"
      gsuite    = true
    },
  ]
}

resource "cloudflare_access_service_token" "token" {
  for_each   = {for app in local.apps_casa : app.subdomain => app}
  account_id = var.cloudflare_account_id
  name       = each.value.subdomain
}

resource "cloudflare_access_application" "app_casa" {
  for_each = {for app in local.apps_casa : app.subdomain => app}

  zone_id                   = var.zone_id_casa
  name                      = each.value.subdomain
  domain                    = "${each.value.subdomain}.${var.domain_casa}"
  type                      = each.value.type
  session_duration          = "336h"
  auto_redirect_to_identity = false
}

resource "cloudflare_access_application" "app_secondary" {
  for_each = {for app in local.apps_secondary : app.subdomain => app}

  zone_id                   = var.zone_id
  name                      = each.value.subdomain
  domain                    = "${each.value.subdomain}.${var.domain}"
  type                      = each.value.type
  session_duration          = "336h"
  auto_redirect_to_identity = false
}

resource "cloudflare_access_application" "kobo" {
  zone_id                   = var.zone_id_casa
  name                      = "kobo"
  domain                    = "calibre-web.${var.domain_casa}/kobo"
  type                      = "self_hosted"
  session_duration          = "336h"
  auto_redirect_to_identity = false
}
