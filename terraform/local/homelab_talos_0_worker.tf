resource "proxmox_vm_qemu" "talos-worker-node-0" {
    name        = "${var.cluster_name}-worker-0"
    iso         = var.iso_image_location
    full_clone  = false
    target_node = "nuc1"
    agent       = var.qemu_guest_agent
    vmid        = "210"
    qemu_os     = "l26" # Linux kernel type
    scsihw      = "virtio-scsi-pci"
    memory      = "45056"
    cores       = 8
    sockets     = 1
    numa        = true
    hotplug     = "network,disk,usb"
    network {
        model  = "virtio"
        tag    = var.homelab_vlan
        bridge = var.network_bridge
        macaddr = "1a:10:50:55:00:00"
    }
    network {
        model  = "virtio"
        bridge = var.network_bridge
        tag    = var.pve_vlan
        macaddr = "1a:20:55:00:00:00"
    }
    network {
        model  = "virtio"
        bridge = var.network_bridge
        tag    = var.wifi_vlan
        macaddr = "1a:20:55:10:10:00"
    }
    disk {
        type    = "virtio"
        size    = var.boot_disk_size
        storage = var.boot_disk_storage_pool
    }
}

resource "proxmox_vm_qemu" "talos-worker-node-1" {
    name        = "${var.cluster_name}-worker-1"
    iso         = var.iso_image_location
    full_clone  = false
    target_node = "pve-lilslim"
    agent       = var.qemu_guest_agent
    vmid        = "211"
    qemu_os     = "l26" # Linux kernel type
    scsihw      = "virtio-scsi-pci"
    memory      = "40960"
    cores       = 8
    sockets     = 1
    numa        = true
    hotplug     = "network,disk,usb"
    network {
        model  = "virtio"
        tag    = var.homelab_vlan
        bridge = var.network_bridge
        macaddr = "1a:10:50:55:00:01"
    }
    network {
        model  = "virtio"
        bridge = var.network_bridge
        tag    = var.pve_vlan
        macaddr = "1a:20:55:00:00:01"
    }
    network {
        model  = "virtio"
        bridge = var.network_bridge
        tag    = var.wifi_vlan
        macaddr = "1a:20:55:10:10:01"
    }
    disk {
        type    = "virtio"
        size    = var.boot_disk_size
        storage = var.boot_disk_storage_pool
    }
}

resource "proxmox_vm_qemu" "talos-worker-node-2" {
    name        = "${var.cluster_name}-worker-2"
    iso         = var.iso_image_location
    full_clone  = false
    target_node = "pve-fatman"
    agent       = var.qemu_guest_agent
    vmid        = "212"
    qemu_os     = "l26" # Linux kernel type
    scsihw      = "virtio-scsi-pci"
    memory      = "40960"
    cores       = 8
    sockets     = 1
    numa        = true
    hotplug     = "network,disk,usb"
    network {
        model  = "virtio"
        tag    = var.homelab_vlan
        bridge = var.network_bridge
        macaddr = "1a:10:50:55:00:02"
    }
    network {
        model  = "virtio"
        bridge = var.network_bridge
        tag    = var.pve_vlan
        macaddr = "1a:20:55:00:00:02"
    }
    network {
        model  = "virtio"
        bridge = var.network_bridge
        tag    = var.wifi_vlan
        macaddr = "1a:20:55:10:10:02"
    }
    disk {
        type    = "virtio"
        size    = var.boot_disk_size
        storage = var.boot_disk_storage_pool
    }
}

resource "proxmox_vm_qemu" "talos-worker-node-3" {
    name        = "${var.cluster_name}-worker-3"
    iso         = var.iso_image_location
    full_clone  = false
    target_node = "pve-fatman"
    agent       = var.qemu_guest_agent
    vmid        = "213"
    qemu_os     = "l26" # Linux kernel type
    scsihw      = "virtio-scsi-pci"
    memory      = "40960"
    cores       = 8
    sockets     = 1
    numa        = true
    hotplug     = "network,disk,usb"
    network {
        model  = "virtio"
        tag    = var.homelab_vlan
        bridge = var.network_bridge
        macaddr = "1a:10:50:55:00:03"
    }
    network {
        model  = "virtio"
        bridge = var.network_bridge
        tag    = var.pve_vlan
        macaddr = "1a:20:55:00:00:03"
    }
    network {
        model  = "virtio"
        bridge = var.network_bridge
        tag    = var.wifi_vlan
        macaddr = "1a:20:55:10:10:03"
    }
    disk {
        type    = "virtio"
        size    = var.boot_disk_size
        storage = var.boot_disk_storage_pool
    }
}

resource "proxmox_vm_qemu" "talos-worker-node-4" {
    name        = "${var.cluster_name}-worker-4"
    iso         = var.iso_image_location
    full_clone  = false
    target_node = "pve-fatman"
    agent       = var.qemu_guest_agent
    vmid        = "214"
    qemu_os     = "l26" # Linux kernel type
    scsihw      = "virtio-scsi-pci"
    memory      = "40960"
    cores       = 8
    sockets     = 1
    numa        = true
    hotplug     = "network,disk,usb"
    network {
        model  = "virtio"
        tag    = var.homelab_vlan
        bridge = var.network_bridge
        macaddr = "1a:10:50:55:00:04"
    }
    network {
        model  = "virtio"
        bridge = var.network_bridge
        tag    = var.pve_vlan
        macaddr = "1a:20:55:00:00:04"
    }
    network {
        model  = "virtio"
        bridge = var.network_bridge
        tag    = var.wifi_vlan
        macaddr = "1a:20:55:10:10:04"
    }
    disk {
        type    = "virtio"
        size    = var.boot_disk_size
        storage = var.boot_disk_storage_pool
    }
}

resource "proxmox_vm_qemu" "talos-worker-node-5" {
    name        = "${var.cluster_name}-worker-5"
    iso         = var.iso_image_location
    full_clone  = false
    target_node = "nuc2"
    agent       = var.qemu_guest_agent
    vmid        = "215"
    qemu_os     = "l26" # Linux kernel type
    scsihw      = "virtio-scsi-pci"
    memory      = "40960"
    cores       = 8
    sockets     = 1
    numa        = true
    hotplug     = "network,disk,usb"
    network {
        model  = "virtio"
        tag    = var.homelab_vlan
        bridge = var.network_bridge
        macaddr = "1a:10:50:55:00:05"
    }
    network {
        model  = "virtio"
        bridge = var.network_bridge
        tag    = var.pve_vlan
        macaddr = "1a:20:55:00:00:05"
    }
    network {
        model  = "virtio"
        bridge = var.network_bridge
        tag    = var.wifi_vlan
        macaddr = "1a:20:55:10:10:05"
    }
    disk {
        type    = "virtio"
        size    = var.boot_disk_size
        storage = var.boot_disk_storage_pool
    }
}
