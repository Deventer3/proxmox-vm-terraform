# proxmox-vm-terrafrom

## Requirements:

- terraform >= 1.8

## Usage:

`main.tf`:
```hcl
module {
    source = "github.com/Deventer3/proxmox-vm-terraform"

    ve_node = "vm13010"
    clone_id = 9001

    qemu_agent = true
    
    vm_hostname = "test"

    gateway = 10.24.103.1
    ip_address = 10.24.103.11
    vlan = 1301

    vm_cores = 2
    vm_ram = 2048
    disk_size = 16 #GB

}
```

```shell
terraform init
terraform plan
terraform apply
```