resource "aws_kms_key" "homelab" {
  description = "homelab KMS"
}

resource "aws_iam_user" "vault" {
  name = "vault"

  tags = {
    terraform = "true"
  }
}

resource "aws_iam_access_key" "vault" {
  user = aws_iam_user.vault.name
}

data "aws_iam_policy_document" "vaultkms" {
  statement {
    sid = "1"

    actions = [
      "kms:DescribeKey",
      "kms:Encrypt",
      "kms:Decrypt"
    ]

    resources = [
      aws_kms_key.homelab.arn,
    ]
  }
}

resource "aws_iam_user_policy" "vault_kms" {
  name = "vaultkms"
  user = aws_iam_user.vault.name

  policy = data.aws_iam_policy_document.vaultkms.json
}