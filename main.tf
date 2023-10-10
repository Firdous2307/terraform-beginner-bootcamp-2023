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

module "home_anime_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.anime.public_path
  content_version = var.anime.content_version
}


resource "terratowns_home" "home_anime" {
  name = "Let's talk about Anime!!"
  description = <<DESCRIPTION
Anime is Japanese animation encompassing hand-drawn and computer-generated styles.
In Japan, it refers to all animated works, while outside Japan, it specifically denotes Japanese-produced animation.
Elements of anime can also appear in video games and animations worldwide.
DESCRIPTION
  domain_name = module.home_anime_hosting.domain_name
  town = "missingo"
  content_version = var.anime.content_version
}


module "home_r-b_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.r-b.public_path
  content_version = var.r-b.content_version
}

resource "terratowns_home" "home_r-b" {
  name = "Welcome to my Music Realm"
  description = <<DESCRIPTION
Let's talk about my favorite genre which is Naruto is a Japanese manga series written and illustrated by Masashi Kishimoto.
It tells the story of Naruto Uzumaki, a young ninja who seeks recognition from his peers and dreams of becoming the Hokage, the leader of his village. 
DESCRIPTION
  domain_name = module.home_r-b_hosting.domain_name
  town = "melomaniac-mansion"
  content_version = var.r-b.content_version
}


module "home_naija-jollof-rice_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.naija-jollof-rice.public_path
  content_version = var.naija-jollof-rice.content_version
}

resource "terratowns_home" "home_naija-jollof-rice" {
  name = "Welcome to my Music Realm"
  description = <<DESCRIPTION
Let's talk about my favorite genre which is Naruto is a Japanese manga series written and illustrated by Masashi Kishimoto.
It tells the story of Naruto Uzumaki, a young ninja who seeks recognition from his peers and dreams of becoming the Hokage, the leader of his village. 
DESCRIPTION
  domain_name = module.home_naija-jollof-rice_hosting.domain_name
  town = "cooker-cove"
  content_version = var.naija-jollof-rice.content_version
}



module "home_christopher-nolan_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.christopher-nolan.public_path
  content_version = var.christopher-nolan.content_version
}

resource "terratowns_home" "home_christopher-nolan" {
  name = "Welcome to my Music Realm"
  description = <<DESCRIPTION
Let's talk about my favorite genre which is Naruto is a Japanese manga series written and illustrated by Masashi Kishimoto.
It tells the story of Naruto Uzumaki, a young ninja who seeks recognition from his peers and dreams of becoming the Hokage, the leader of his village. 
DESCRIPTION
  domain_name = module.home_christopher-nolan.domain_name
  town = "video-valley"
  content_version = var.christopher-nolan.content_version
}



module "home_lagos-life_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.lagos-life.public_path
  content_version = var.lagos-life.content_version
}

resource "terratowns_home" "home_lagos-life" {
  name = "Welcome to my Music Realm"
  description = <<DESCRIPTION
Let's talk about my favorite genre which is Naruto is a Japanese manga series written and illustrated by Masashi Kishimoto.
It tells the story of Naruto Uzumaki, a young ninja who seeks recognition from his peers and dreams of becoming the Hokage, the leader of his village. 
DESCRIPTION
  domain_name = module.home_lagos-life.domain_name
  town = "the-nomad-pad"
  content_version = var.lagos-life.content_version
}




module "home_fifa-23_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.fifa-23.public_path
  content_version = var.fifa-23.content_version
}

resource "terratowns_home" "home_fifa-23" {
  name = "Welcome to my Music Realm"
  description = <<DESCRIPTION
Let's talk about my favorite genre which is Naruto is a Japanese manga series written and illustrated by Masashi Kishimoto.
It tells the story of Naruto Uzumaki, a young ninja who seeks recognition from his peers and dreams of becoming the Hokage, the leader of his village. 
DESCRIPTION
  domain_name = module.home_fifa-23.domain_name
  town = "gamers-grotto"
  content_version = var.fifa-23.content_version
}





