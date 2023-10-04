# [AWS S3 Bucket Resource Docs]
# Available at:(https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)
resource "aws_s3_bucket" "website_bucket" {
# [S3 Bucket Naming Rules]
# Available at:(https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html?icmpid=docs_amazons3_console)
bucket = var.bucket_name
tags = {
    UserUuid = var.user_uuid
  }
}  
