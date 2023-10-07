terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
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
provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token

}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.teacherseat_user_uuid
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  content_version = var.content_version
  assets_path = var.assets_path
}


resource "terratowns_home" "home" {
  name = "Let's talk about Naruto!!"
  description = <<DESCRIPTION
Naruto is a Japanese manga series written and illustrated by Masashi Kishimoto.
It tells the story of Naruto Uzumaki, a young ninja who seeks recognition from his peers and dreams of becoming the Hokage, the leader of his village. 
DESCRIPTION
  domain_name = module.terrahouse_aws.cloudfront_url
  town = "missingo"
  content_version = 1
}