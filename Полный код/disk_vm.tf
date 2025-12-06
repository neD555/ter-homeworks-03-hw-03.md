resource "yandex_compute_disk" "storage_data" {
  count = 3

  name = "storage-data-${count.index + 1}"
  size = 1
  zone = var.default_zone
}

resource "yandex_compute_instance" "storage" {
  name        = "storage"
  platform_id = var.platform_id
  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = 10
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    ssh-keys = "ubuntu:${local.ssh_public_key}"
  }

  scheduling_policy {
    preemptible = true
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.storage_data
    content {
      disk_id = secondary_disk.value.id
    }
  }
}
