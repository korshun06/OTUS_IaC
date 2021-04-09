terraform {
  backend "remote" {
    organization = "korshun06"

    workspaces {
      name = "OTUS_IaC"
    }
  }

  required_version = ">= 0.13.0"
}
