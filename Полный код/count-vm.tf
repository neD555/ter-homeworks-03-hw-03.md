locals {
  web_names = ["web-1", "web-2"]
}

resource "yandex_compute_instance" "web" {
  count       = length(local.web_names)
  name        = local.web_names[count.index]
  platform_id = "standard-v1"

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

  # web после БД
  depends_on = [yandex_compute_instance.db]
}
