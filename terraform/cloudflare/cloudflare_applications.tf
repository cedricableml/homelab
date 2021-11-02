locals {
  apps = [
    {
      subdomain   = "bazarr"
      type        = "self_hosted"
      certificate = true
      gsuite      = true
    },
    {
      subdomain   = "calibre"
      type        = "self_hosted"
      certificate = true
      gsuite      = true
    },
    {
      subdomain   = "calibre-web"
      type        = "self_hosted"
      certificate = true
      gsuite      = true
    },
    {
      subdomain   = "dizque"
      type        = "self_hosted"
      certificate = true
      gsuite      = true
    },
    {
      subdomain   = "filebrowser"
      type        = "self_hosted"
      certificate = true
      gsuite      = true
    },
    {
      subdomain   = "change-detection"
      type        = "self_hosted"
      certificate = true
      gsuite      = true
    },
    {
      subdomain   = "grafana"
      type        = "self_hosted"
      certificate = true
      gsuite      = true
    },
    {
      subdomain   = "hass"
      type        = "self_hosted"
      certificate = true
      gsuite      = true
    },{
      subdomain   = "k8sapi"
      type        = "self_hosted"
      certificate = true
      gsuite      = true
    },
    {
      subdomain   = "longhorn"
      type        = "self_hosted"
      certificate = true
      gsuite      = true
    },
    {
      subdomain   = "minio"
      type        = "self_hosted"
      certificate = true
      gsuite      = true
    },
    {
      subdomain   = "nzbget"
      type        = "self_hosted"
      certificate = true
      gsuite      = true
    },
    {
      subdomain   = "plex-requests"
      type        = "self_hosted"
      certificate = true
      gsuite      = true
    },
    {
      subdomain   = "prowlarr"
      type        = "self_hosted"
      certificate = true
      gsuite      = true
    },
    {
      subdomain   = "qbittorrent"
      type        = "self_hosted"
      certificate = true
      gsuite      = true
    },
    {
      subdomain   = "radarr"
      type        = "self_hosted"
      certificate = true
      gsuite      = true
    },
    {
      subdomain   = "readarr"
      type        = "self_hosted"
      certificate = true
      gsuite      = true
    },
    {
      subdomain   = "readarr-audiobooks"
      type        = "self_hosted"
      certificate = true
      gsuite      = true
    },
    {
      subdomain   = "sonarr"
      type        = "self_hosted"
      certificate = true
      gsuite      = true
    },
    {
      subdomain   = "storage"
      type        = "ssh"
      certificate = true
      gsuite      = true
    },
    {
      subdomain   = "tautulli"
      type        = "self_hosted"
      certificate = true
      gsuite      = true
    },
    {
      subdomain   = "unifi"
      type        = "self_hosted"
      certificate = true
      gsuite      = true
    },
    {
      subdomain   = "vault"
      type        = "self_hosted"
      certificate = true
      gsuite      = true
    },
    {
      subdomain   = "edgerouter"
      type        = "self_hosted"
      certificate = true
      gsuite      = true
    },
    {
      subdomain   = "login"
      type        = "self_hosted"
      certificate = true
      gsuite      = true
    },
    {
      subdomain   = "dex"
      type        = "self_hosted"
      certificate = true
      gsuite      = true
    },
    {
      subdomain   = "falcosidekick-ui"
      type        = "self_hosted"
      certificate = true
      gsuite      = true
    },
    {
      subdomain   = "falcosidekick"
      type        = "self_hosted"
      certificate = true
      gsuite      = true
    },
  ]
}

resource "cloudflare_access_application" "app" {
  for_each = {for app in local.apps : app.subdomain => app}

  zone_id                   = var.zone_id
  name                      = each.value.subdomain
  domain                    = "${each.value.subdomain}.${var.domain}"
  type                      = each.value.type
  session_duration          = "240h"
  auto_redirect_to_identity = true
}

resource "cloudflare_access_policy" "gsuite" {
  for_each = {for app in local.apps : app.subdomain => app}

  zone_id        = var.zone_id
  application_id = cloudflare_access_application.app[each.value.subdomain].id

  name       = "allow ${var.email_domain}"
  precedence = "10"
  decision   = "allow"

  dynamic "include" {
    for_each = each.value.gsuite == true ? [1] : []
    content {
      email_domain = [var.email_domain]
    }
  }

  dynamic "include" {
    for_each = each.value.certificate == true ? [1] : []
    content {
      certificate = true
    }
  }

#  include {
#    email_domain = [var.email_domain]
#  }
#
#  include {
#    certificate = true
#  }
}

resource "cloudflare_access_mutual_tls_certificate" "mtls" {
  zone_id              = var.zone_id
  name                 = "Root CA"
  certificate          = var.ca_pem
#  associated_hostnames = [".*.${var.domain}"]
}
