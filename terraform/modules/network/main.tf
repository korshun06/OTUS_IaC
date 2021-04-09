terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.55.0"
    }
  }
}

resource "yandex_vpc_network" "network-1" {
  name = "network-test"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet-test"
  zone           = var.zone
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}