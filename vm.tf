
resource "proxmox_virtual_environment_vm" "vm" {
  lifecycle {
      ignore_changes = [ node_name ]
    }

  name      = var.vm_hostname

  node_name = var.pve_node
  migrate   = true

  agent {
    enabled = var.qemu_agent
  }

  stop_on_destroy = true

  clone {
    datastore_id    = var.pve_datastore
    vm_id           = var.clone_id
  }

  cpu {
    cores   = var.vm_cores
    type    = "x86-64-v2-AES"
  }

  initialization {
    datastore_id = var.pve_datastore

    ip_config {
      ipv4 {
        address = "${var.ip_address}/24"
        gateway = var.gateway
      }
    }

  }

  disk {
    interface = "virtio0" 
    size = var.disk_size
  }

  network_device {
    bridge = var.pve_bridge
    vlan_id = var.vlan_id
  }

  operating_system {
    type = "l26"
  }

  serial_device {}
}