resource "proxmox_vm_qemu" "talos-control-plane-node-0" {
    name        = "${var.cluster_name}-controlplane-0"
    iso         = var.iso_image_location
    target_node = "nuc1"
    vmid        = "200"
    qemu_os     = "l26" # Linux kernel type
    memory      = "8192"
    cores       = 4
    sockets     = 1
    numa        = true
    hotplug 	= "network,disk,usb,cpu,memory"
    network {
        model  = "virtio"
        bridge = var.public_network_bridge
        tag    = var.public_vlan
        macaddr = "1a:10:50:00:00:00"
    }
    disk {
        type    = "virtio"
        size    = var.boot_disk_size
        storage = var.boot_disk_storage_pool
    }
}

resource "proxmox_vm_qemu" "talos-control-plane-node-1" {
    name        = "${var.cluster_name}-controlplane-1"
    iso         = var.iso_image_location
    target_node = "pve-lilslim"
    vmid        = "201"
    qemu_os     = "l26" # Linux kernel type
    memory      = "8192"
    cores       = 4
    sockets     = 1
    numa        = true
    hotplug 	= "network,disk,usb,cpu,memory"
    network {
        model  = "virtio"
        bridge = var.public_network_bridge
        tag    = var.public_vlan
        macaddr = "1a:10:50:00:00:01"
    }
    disk {
        type    = "virtio"
        size    = var.boot_disk_size
        storage = var.boot_disk_storage_pool
    }
}

resource "proxmox_vm_qemu" "talos-control-plane-node" {
    name        = "${var.cluster_name}-controlplane-2"
    iso         = var.iso_image_location
    target_node = "pve-fatman"
    vmid        = "202"
    qemu_os     = "l26" # Linux kernel type
    memory      = "8192"
    cores       = 4
    sockets     = 1
    numa        = true
    hotplug 	= "network,disk,usb,cpu,memory"
    network {
        model  = "virtio"
        bridge = var.public_network_bridge
        tag    = var.public_vlan
        macaddr = "1a:10:50:00:00:02"
    }
    disk {
        type    = "virtio"
        size    = var.boot_disk_size
        storage = var.boot_disk_storage_pool
    }
}
