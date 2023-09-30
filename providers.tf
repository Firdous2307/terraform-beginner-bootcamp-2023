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
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
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