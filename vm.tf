
resource "proxmox_virtual_environment_vm" "vm" {
  lifecycle {
    ignore_changes = [node_name]
  }

  name = var.vm_hostname

  node_name = var.pve_node
  migrate   = true

  agent {
    enabled = var.qemu_agent
  }
  clone {
    vm_id = var.clone_id
  }

  stop_on_destroy = true

  cpu {
    cores = var.vm_cores
    type  = "x86-64-v2-AES"
  }

  initialization {
    datastore_id = var.pve_datastore

    user_account {
      username = var.vm_username
      keys     = var.sshkeys
    }

    ip_config {
      ipv4 {
        address = "${var.ip_address}"
        gateway = var.gateway
      }
    }

  }

  disk {
    interface    = "scsi0"
    iothread     = true
    discard      = "on"
    size         = var.disk_size
  }

  network_device {
    bridge  = var.pve_bridge
    vlan_id = var.vlan_id
  }

  operating_system {
    type = "l26"
  }

  serial_device {}
}
