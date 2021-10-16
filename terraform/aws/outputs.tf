output "kms_key_id" {
  value = aws_kms_key.homelab.id
}

output "kms_key_arn" {
  value = aws_kms_key.homelab.arn
}