terraform {
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "mohfird23"

  #  workspaces {
  #    name = "terra-house-01"
  #  }
  #}
  #cloud {
  #  organization = "mohfird23"
  #  workspaces {
  #    name = "terra-house-01"
  #  }
  #}
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.16.2"
    }
  }
}
provider "aws" {
}
provider "random" {
  # Configuration options
}