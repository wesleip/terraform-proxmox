terraform {
  required_providers {
    proxmox = {
        source = "Telmate/proxmox"
        version = "3.0.1-rc4"
    }
  }
}

provider "proxmox" {
    pm_api_url = "var.proxmox_url"
    pm_api_token_id = "var.proxmox_token_id"
    pm_api_token_secret = "var.proxmox_token_secret"
    pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "test_server" {
    count = 1
    name = "test-vm-${count.index + 1}"
    target_node = var.proxmox_host
    clone = var.template_name
    agent = 1
    os_type = "cloud-init"
    cores = 2
    sockets = 1
    cpu = "host"
    memory = 2048
    scsihw = "virtio-scsi-pci"
    bootdisk = "scsi0"
    disk {
        slot = 0
        size = "10G"
        type = "scsi"
        storage = "local-lvm"
        iothread = 1
    }

    network {
        model = "virtio"
        bridge = "vmbr0"
    }

    lifecycle {
        ignore_changes = [
            network,
        ]
    }

    ipconfig0 = "ip=192.168.0.9${count.index + 1}/24,gw=192.168.0.1"

    sshkeys = <<EOF
    ${var.ssh_key}
    EOF
}