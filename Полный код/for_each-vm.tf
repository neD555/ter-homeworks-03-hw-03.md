locals {
  db_vms_map = {
    for vm in var.each_vm :
    vm.vm_name => vm
  }
}

resource "yandex_compute_instance" "db" {
  for_each    = local.db_vms_map
  name        = each.value.vm_name
  platform_id = var.platform_id

  resources {
    cores  = each.value.cpu
    memory = each.value.ram
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = each.value.disk_volume
    }
  }

  network_interface {
    subnet_id          = var.subnet_id
    nat                = true
    security_group_ids = var.security_group_ids
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${local.ssh_public_key}"
  }

  scheduling_policy {
    preemptible = true
  }
}
