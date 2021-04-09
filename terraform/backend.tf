terraform {
  backend "remote" {
    organization = "korshun06"
    hostname     = "app.terraform.io"

    workspaces {
      name = "OTUS_IaC"
    }
  }

  required_version = ">= 0.13.0"
}