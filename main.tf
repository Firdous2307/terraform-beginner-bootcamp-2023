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
  endpoint = "http://localhost:4567/api"
  user_uuid="e328f4ab-b99f-421c-84c9-4ccea042c7d1" 
  token="9b49b3fb-b8e9-483c-b703-97ba88eef8e0"

}

# module "terrahouse_aws" {
# source = "./modules/terrahouse_aws"
# user_uuid = var.user_uuid
# bucket_name = var.bucket_name
# index_html_filepath = var.index_html_filepath
# error_html_filepath = var.error_html_filepath
# content_version = var.content_version
# assets_path = var.assets_path
# }  


resource "terratowns_home" "home" {
  name = "Let's talk about Naruto!!"
  description = <<DESCRIPTION
Naruto is a Japanese manga series written and illustrated by Masashi Kishimoto.
It tells the story of Naruto Uzumaki, a young ninja who seeks recognition from his peers and dreams of becoming the Hokage, the leader of his village. 
DESCRIPTION
  #domain_name = module.terrahouse_aws.cloudfront_url
  domain_name = "3fdq3gz.cloudfront.net"
  town = "leaf-village"
  content_version = 1
}