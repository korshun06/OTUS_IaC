variable "yc_zone" {
  type      = string
  sensitive = true
}

variable "yc_cloud_id" {
  type      = string
  sensitive = true
}

variable "yc_folder_id" {
  type      = string
  sensitive = true
}

variable "yc_image_id" {
  type = string
}

variable "yc_token" {
  type      = string
  sensitive = true
}

variable "front_count" {
  type = number
}

variable "back_count" {
  type = number
}

variable "db_count" {
  type = number
}

variable "pb_ssh_keys" {
  type      = string
  sensitive = true
}

variable "pvt_ssh_key" {
  type      = string
  sensitive = true
}