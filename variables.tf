variable "terratowns_endpoint" {
 type = string
}

variable "terratowns_access_token" {
 type = string
}

variable "teacherseat_user_uuid" {
 type = string
}

variable "anime" {
  type = object({
    public_path = string
    content_version = number
  })
}

variable "r-b" {
  type = object({
    public_path = string
    content_version = number
  })
}

variable "naija-jollof-rice" {
  type = object({
    public_path = string
    content_version = number
  })
}

variable "christopher-nolan" {
  type = object({
    public_path = string
    content_version = number
  })
}

variable "lagos-life" {
  type = object({
    public_path = string
    content_version = number
  })
}

variable "fifa-23" {
  type = object({
    public_path = string
    content_version = number
  })
}