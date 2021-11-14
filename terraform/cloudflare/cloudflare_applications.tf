locals {
  apps = [
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
      subdomain = "filebrowser"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "change-detection"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "grafana"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "hass"
      type      = "self_hosted"
      gsuite    = true
    }, {
      subdomain = "k8sapi"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "longhorn"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "minio"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "nzbget"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "requests"
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
      subdomain = "storage"
      type      = "ssh"
      gsuite    = true
    },
    {
      subdomain = "nuc1"
      type      = "ssh"
      gsuite    = true
    },
    {
      subdomain = "nuc2"
      type      = "ssh"
      gsuite    = true
    },
    {
      subdomain = "tautulli"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "unifi"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "vault"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "edgerouter"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "falcosidekick-ui"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "falcosidekick"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "tv"
      type      = "self_hosted"
      gsuite    = true
    },
    {
      subdomain = "rook"
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
      subdomain = "recipes"
      type      = "self_hosted"
      gsuite    = true
    },
  ]
}


resource "cloudflare_access_service_token" "token" {
  for_each   = {for app in local.apps : app.subdomain => app}
  account_id = var.cloudflare_account_id
  name       = each.value.subdomain
}

resource "cloudflare_access_policy" "token" {
  for_each = {for app in local.apps : app.subdomain => app}

  zone_id        = var.zone_id
  application_id = cloudflare_access_application.app_casa[each.value.subdomain].id

  name       = "allow any service token"
  precedence = "5"
  decision   = "non_identity"

  include {
    service_token = [cloudflare_access_service_token.token[each.value.subdomain].id]
  }
}

resource "cloudflare_access_application" "app_casa" {
  for_each = {for app in local.apps : app.subdomain => app}

  zone_id                   = var.zone_id_casa
  name                      = each.value.subdomain
  domain                    = "${each.value.subdomain}.${var.domain_casa}"
  type                      = each.value.type
  session_duration          = "240h"
  auto_redirect_to_identity = true
}

resource "cloudflare_access_policy" "gsuite_casa" {
  for_each = {for app in local.apps : app.subdomain => app}

  zone_id        = var.zone_id_casa
  application_id = cloudflare_access_application.app_casa[each.value.subdomain].id

  name       = "allow ${var.email_domain}"
  precedence = "10"
  decision   = "allow"

  dynamic "include" {
    for_each = each.value.gsuite == true ? [1] : []
    content {
      email_domain = [var.email_domain]
    }
  }
}
