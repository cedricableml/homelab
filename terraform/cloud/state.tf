terraform {
  experiments = [module_variable_optional_attrs]
  backend "remote" {
    organization = "cloudpush"
    workspaces {
      name = "homelab-cloud"
    }
  }
}
