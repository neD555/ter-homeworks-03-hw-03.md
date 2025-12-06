token        = "t1.9euelZqXz8iWz52------------------iMqXzfrxqfmfItoQtBw"
cloud_id     = "b1g5bqv45d5n8tdbrniv"
folder_id    = "b1ghtgo92hqnuj1kv2ao"
default_zone = "ru-central1-a"

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
# добавил
platform_id = "standard-v1"
web_count   = 2
