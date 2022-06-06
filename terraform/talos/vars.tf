variable "vsphere_user" { sensitive = true }
variable "vsphere_password" { sensitive = true }
variable "vsphere_address" {}
variable "github_owner" {
  type        = string
  description = "github owner"
  default     = "0dragosh"
}

variable "github_token" {
  type        = string
  description = "github token"
}

variable "repository_name" {
  type        = string
  default     = "homelab"
  description = "github repository name"
}

variable "repository_visibility" {
  type        = string
  default     = "public"
  description = "How visible is the github repo"
}

variable "branch" {
  type        = string
  default     = "main"
  description = "branch name"
}

variable "target_path" {
  type        = string
  default     = "k8s/clusters/homelab-talos-0/flux"
  description = "flux sync target path"
}
