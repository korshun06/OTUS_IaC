variable "image_id" {
  type = string
}

variable "back_count" {
  type = number
}

variable "subnet_id" {
  type = string
}

variable "ssh_keys" {
  type = string
  sensitive = true
}