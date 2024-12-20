variable "pve_node" {
  type = string
  validation {
    condition     = contains(["VM13010", "VM13011", "VM13012"], var.pve_node)
    error_message = "Must be a valid node in the cluster: VM13010, VM13011, VM13012"
  }
}
variable "pve_datastore" {
  type    = string
  default = "local-zfs"
}
variable "pve_bridge" {
  type    = string
  default = "vmbr0"
}
variable "gateway" {
  type = string
}
variable "clone_id" {
  type    = number
  default = 9001
}
variable "ip_address" {
  type = string

  validation {
    condition     = can(cidrnetmask(var.ip_address))
    error_message = "Must be a valid IPv4 CIDR address."
  }
}
variable "vlan_id" {
  type = number
  validation {
    condition = (
      var.vlan_id >= 1 &&
      var.vlan_id <= 4094
    )
    error_message = "The vlan_id must be a valid VLAN"
  }
}
variable "vm_hostname" {
  type = string
}
variable "qemu_agent" {
  type    = bool
  default = true
}
variable "vm_cores" {
  type    = number
  default = 2

  validation {
    condition = (
      var.vm_cores >= 2 &&
      var.vm_cores <= 8
    )
    error_message = "The dont use too manny cores"
  }
}
variable "vm_ram" {
  type    = number
  default = 2048

  validation {
    condition = (
      var.vm_ram >= 512 &&
      var.vm_ram <= 8192
    )
    error_message = "The dont use too much RAM"
  }
}
variable "vm_tags" {
  type    = list(any)
  default = ["terraform"]
}
variable "disk_size" {
  type    = number
  default = 16

  validation {
    condition = (
      var.disk_size >= 8 &&
      var.disk_size <= 64
    )
    error_message = "The dont use too much GB's"
  }
}
variable "vm_username" {
  type    = string
  default = "ansible"
}
variable "sshkeys" {
  type = list(string)
}
