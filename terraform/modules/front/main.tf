terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.55.0"
    }
  }
}

resource "yandex_compute_instance" "vm-1" {
  count = var.front_count
  name = "front-${count.index}"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = 10
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = var.ssh_keys
  }

  provisioner "remote-exec" {
    inline = [
      "echo Connect OK!",
      "exit"
      ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.pvt_ssh_key)
      host        = self.network_interface.0.nat_ip_address
    }
  }

  provisioner "local-exec" {
        command = "sleep 20"
  }

  provisioner "local-exec" {
    working_dir = "../ansible"
    command = "ansible-playbook -u ubuntu -i '${self.network_interface.0.nat_ip_address},' --private-key '${var.pvt_ssh_key}' -e 'ansible_python_interpreter=/usr/bin/python3' main.yml"
  }
}