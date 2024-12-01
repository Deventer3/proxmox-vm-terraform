# proxmox-vm-terrafrom

## Requirements:

- terraform >= 1.8

## Usage:

`main.tf`:
```hcl
module "vm" {
  source = "github.com/Deventer3/proxmox-vm-terraform"

  pve_node = "VM13010"

  qemu_agent = true

  vm_hostname = "test"
  vm_username = "ansible"
  sshkeys = [" SSH PUBLIC KEY "]

  gateway    = "10.24.103.1"
  ip_address = "10.24.103.11/24"
  vlan_id    = 1301

  vm_cores  = 2
  vm_ram    = 2048
  disk_size = 16 #GB

}
```

```shell
terraform init
terraform plan
terraform apply
```