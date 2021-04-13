module "network" {
  source = "./modules/network"
  zone   = var.yc_zone
}

module "front" {
  source      = "./modules/front"
  image_id    = var.yc_image_id
  front_count = var.front_count
  subnet_id   = module.network.subnet_id
  ssh_keys    = var.pb_ssh_keys
  pvt_ssh_key = var.pvt_ssh_key
}

module "back" {
  source     = "./modules/back"
  image_id   = var.yc_image_id
  back_count = var.back_count
  subnet_id  = module.network.subnet_id
  ssh_keys   = var.pb_ssh_keys
}

module "db" {
  source    = "./modules/db"
  image_id  = var.yc_image_id
  db_count  = var.db_count
  subnet_id = module.network.subnet_id
  ssh_keys  = var.pb_ssh_keys
}
