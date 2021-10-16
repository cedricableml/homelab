output "kms_key_id" {
  value = aws_kms_key.homelab.id
}

output "kms_key_arn" {
  value = aws_kms_key.homelab.arn
}

output "vault_creds" {
  sensitive = true
  value = {
    access_key = aws_iam_access_key.vault.id
    secret_key = aws_iam_access_key.vault.secret
  }
}
