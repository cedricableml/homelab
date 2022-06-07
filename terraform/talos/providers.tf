provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_address
  allow_unverified_ssl = true
}

provider "flux" {
  # Configuration options
}

#provider "kubectl" {}
#
#provider "kubernetes" {
#  config_path = "~/.kube/config"
#}

provider "github" {
  owner = var.github_owner
  token = var.github_token
}
