variable "ssh_key" {
    default = ""
}

variable "proxmox_host" {
    default = "pve"
}

variable "template_name" {
    default = "ubuntu-2004-cloudinit-template"
}

variable "proxmox_url" {
    default = "https://192.168.1.254:8006/api2/json"
}

variable "proxmox_token_id" {
    default = "terraform@pam!terraform"
}

variable "proxmox_token_secret" {
    default = "73bc5d4e-638f-4b5b-890d-eb384f5bb47f"
}