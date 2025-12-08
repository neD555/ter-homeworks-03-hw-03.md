resource "yandex_compute_instance" "web" {
  count       = var.web_count
  name        = "web-${count.index + 1}"
  platform_id = var.platform_id

  resources {
    cores  = var.web_cpu
    memory = var.web_ram
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = var.web_disk
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

  depends_on = [yandex_compute_instance.db]
}
