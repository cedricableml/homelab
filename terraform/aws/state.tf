terraform {
  backend "remote" {
    # organization from TF_CLI_ARGS_init="-backend-config='organization=$TFE_ORG'"
    workspaces {
      name = "homelab-aws"
    }
  }
}
