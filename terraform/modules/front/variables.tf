variable "image_id" {
  type = string
}

variable "front_count" {
  type = number
}

variable "subnet_id" {
  type = string
}

variable "ssh_keys" {
  type = string
  sensitive = true
}

variable "pvt_ssh_key" {
  type = string
  sensitive = true
}