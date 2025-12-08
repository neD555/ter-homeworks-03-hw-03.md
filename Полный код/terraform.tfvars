token        = "XXX"
cloud_id     = "XXX"
folder_id    = "XXX"
default_zone = "ru-central1-a"

platform_id = "standard-v1"
ssh_user    = "ubuntu"

web_count = 2
web_cpu   = 2
web_ram   = 2
web_disk  = 10

each_vm = [
  {
    vm_name     = "main"
    cpu         = 2
    ram         = 4
    disk_volume = 20
  },
  {
    vm_name     = "replica"
    cpu         = 2
    ram         = 2
    disk_volume = 10
  }
]

vpc_name     = "develop"
default_cidr = ["10.0.0.0/24"]
