locals {
  ingress_ports = [
    {
      description = "allow HTTP"
      port        = 80
    },
    {
      description = "allow HTTPS"
      port        = 443
    },
    {
      description = "allow SSH"
      port        = 22
    }
  ]
}

resource "yandex_vpc_security_group" "example" {
  name       = "example_dynamic"
  folder_id  = var.folder_id
  network_id = yandex_vpc_network.develop.id

  egress {
    protocol       = "TCP"
    description    = "allow all egress TCP"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65365
  }

  dynamic "ingress" {
    for_each = local.ingress_ports
    content {
      protocol       = "TCP"
      description    = ingress.value.description
      v4_cidr_blocks = ["0.0.0.0/0"]
      port           = ingress.value.port
      from_port      = -1
      to_port        = -1
    }
  }
}
