locals {
  ansible_inventory = templatefile("${path.module}/templates/inventory.tmpl", {
    webservers = yandex_compute_instance.web
    databases  = values(yandex_compute_instance.db)
    storage    = [yandex_compute_instance.storage]
  })
}

resource "local_file" "ansible_inventory" {
  filename = "${path.module}/inventory.ini"
  content  = local.ansible_inventory
}
