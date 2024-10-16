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
    default = "terraform@pam!terraform_token_id"
}

variable "proxmox_token_secret" {
    default = "2049a417-90ed-4bb4-99a8-9934d2ea7062"
}