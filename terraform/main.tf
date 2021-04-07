terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  token     = var.yc_token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

module "network" {
  source = "./modules/network"
  zone   = var.zone
}

module "front" {
  source      = "./modules/front"
  image_id    = var.image_id
  front_count = var.front_count
  subnet_id   = module.network.subnet_id
  ssh_keys    = var.ssh_keys
}

module "back" {
  source     = "./modules/back"
  image_id   = var.image_id
  back_count = var.back_count
  subnet_id  = module.network.subnet_id
  ssh_keys   = var.ssh_keys
}

module "db" {
  source    = "./modules/db"
  image_id  = var.image_id
  db_count  = var.db_count
  subnet_id = module.network.subnet_id
  ssh_keys  = var.ssh_keys
}
