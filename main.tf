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
  cloud {
    organization = "mohfird23"
    workspaces {
      name = "terra-house-01"
    }
  }
}
provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token

}

module "anime_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.anime.public_path
  content_version = var.anime.content_version
}


resource "terratowns_home" "anime" {
  name = "Let's talk about Anime!!"
  description = <<DESCRIPTION
Anime is Japanese animation encompassing hand-drawn and computer-generated styles.
In Japan, it refers to all animated works, while outside Japan, it specifically denotes Japanese-produced animation.
Elements of anime can also appear in video games and animations worldwide.
DESCRIPTION
  domain_name = module.anime_hosting.domain_name
  town = "missingo"
  content_version = var.anime.content_version
}


module "r-b_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.r-b.public_path
  content_version = var.r-b.content_version
}

resource "terratowns_home" "r-b" {
  name = "Welcome to my Music Realm"
  description = <<DESCRIPTION
Welcome to Melomaniac Mansion, where we groove to the smooth melodies and soulful vocals of R&B music.
R&B tells stories of love and life through its beats.
From classics to modern hits, explore a genre that spans generations. 
Let's dive into the R&B realm! 🎵🎤 #RnBRealm"
DESCRIPTION
  domain_name = module.r-b_hosting.domain_name
  town = "melomaniac-mansion"
  content_version = var.r-b.content_version
}


module "naija-jollof-rice_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.naija-jollof-rice.public_path
  content_version = var.naija-jollof-rice.content_version
}

resource "terratowns_home" "naija-jollof-rice" {
  name = "Naija Jollof Rice is the Best Out There"
  description = <<DESCRIPTION
  Naija Jollof Rice, a culinary masterpiece from Nigeria, is a delightful medley of perfectly seasoned rice, vibrant red peppers, and a symphony of flavors that dance on your taste buds.
  This iconic dish embodies the heart and soul of West African cuisine, and it's the epitome of comfort and celebration on every plate.
  DESCRIPTION
  domain_name = module.naija-jollof-rice_hosting.domain_name
  town = "cooker-cove"
  content_version = var.naija-jollof-rice.content_version
}

module "christopher-nolan_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.christopher-nolan.public_path
  content_version = var.christopher-nolan.content_version
}

resource "terratowns_home" "christopher-nolan" {
  name = "The Cinematic World of Christopher Nolan"
  description = <<DESCRIPTION
  Explore the visionary works of Christopher Nolan, a master of storytelling and filmmaking.
  Dive into mind-bending narratives and breathtaking visuals in his iconic movies like
  Inception, The Dark Knight Trilogy, and Interstellar etc.
  DESCRIPTION
  domain_name = module.christopher-nolan_hosting.domain_name
  town = "video-valley"
  content_version = var.christopher-nolan.content_version
}