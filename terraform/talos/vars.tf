variable "cluster_name" {
    default = "homelab-talos-0"
  
}
variable "worker_node_count" {
    description = "Number of worker nodes for the cluster."
    type = number
    default = 5
}

variable "worker_node_memory" {
    description = "The amount of memory in MiB to give the worker nodes."
    type = number
    default = 32768
}

variable "control_plane_node_count" {
    description = "Number of control plane nodes for the cluster. Must be an odd number."
    type = number
    default = 3
    validation {
        condition = var.control_plane_node_count % 2 != 0
        error_message = "The control plane node count must be an odd number."
    }
}

variable "control_plane_node_memory" {
    description = "The amount of memory in MiB to give the control plane nodes."
    type = number
    default = 8192
}

variable "iso_image_location" {
    description = "The location of the Talos iso image on the proxmox host (<storage pool>:<content type>/<file name>.iso)."
    type = string
    default = "zfs-iso:iso/talos-amd64.iso"
}

variable "boot_disk_storage_pool" {
    description = "The name of the storage pool where boot disks for the cluster nodes will be stored."
    type = string
    default = "ceph"
}

variable "boot_disk_size" {
    description = "The size of the boot disks. A numeric string with G, M, or K appended ex: 512M or 32G."
    type = string
    default = "10G"
}

variable "config_network_bridge" {
    description = "The name of the network bridge on the Proxmox host that will be used for the configuration network."
    type = string
    default = "vmbr0"
}

variable "public_vlan" {
    description = "The VLAN that nodes will recieve DHCP IP assignments and be accessible to other clients on the network."
    type = number
    default = 1000
}

variable "public_network_bridge" {
    description = "The name of the network bridge on the Proxmox host that will be used for the publicu network."
    type = string
    default = "vmbr0"
}

variable "proxmox_host_node" {
    description = "The name of the proxmox node where the cluster will be deployed"
    type = string
    default = "pve-fatman"
}

variable "proxmox_tls_insecure" {
    description = "If the TLS connection is insecure (self-signed). This is usually the case."
    type = bool
    default = true
}

variable "proxmox_debug" {
    description = "If the debug flag should be set when interacting with the Proxmox API."
    type = bool
    default = false
}