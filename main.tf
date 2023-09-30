# [Random String Resource Docs]
# Available at:(https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string)
resource "random_string" "bucket_name" {
  lower = true
  upper = false
  length   = 32
  special  = false
}

# [AWS S3 Bucket Resource Docs]
# Available at:(https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)
resource "aws_s3_bucket" "example" {
# [S3 Bucket Naming Rules]
# Available at:(https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html?icmpid=docs_amazons3_console)
bucket = random_string.bucket_name.result
tags = {
    UserUuid = var.user_uuid
  }
}  
