output "cloudflare_argo_tunnel_1" {
  value     = cloudflare_argo_tunnel.tunnel1
  sensitive = true
}

output "service_tokens" {
  value     = tomap({
    for idx, token in cloudflare_access_service_token.token : idx =>
      {
        client_id = token.client_id,
        client_secret = token.client_secret
      }
  })
  sensitive = true
}
