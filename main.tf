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
}
module "terrahouse_aws" {
source = "./modules/terrahouse_aws"
user_uuid = var.user_uuid
bucket_name = var.bucket_name
}  
