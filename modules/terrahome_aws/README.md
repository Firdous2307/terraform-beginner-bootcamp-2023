## Terrahome AWS

```tf
module "home_r-b" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.r-b_public_path
  content_version = var.content_version
}
```

```tf
module "home_naija-jollof-rice" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.
naija-jollof-rice_public_path
  content_version = var.content_version
}
```

```tf
module "home_christopher-nolan" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.
christopher-nolan_public_path
  content_version = var.content_version
}
```

```tf
module "home_lagos-life" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.lagos-life_public_path
  content_version = var.content_version
}
```

```tf
module "home_fifa-23" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.fifa-23_public_path
  content_version = var.content_version
}
```


THe public directory expects the following:
- index.html
- error.html
- assets

ALl top level files in assets will be copied, but not any subdirectories.