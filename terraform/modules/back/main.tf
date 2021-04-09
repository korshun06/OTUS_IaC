terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.55.0"
    }
  }
}

resource "yandex_compute_instance" "vm-2" {
  count = var.back_count
  name = "back-${count.index}"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = false
  }

  metadata = {
    ssh-keys = var.ssh_keys
  }
}