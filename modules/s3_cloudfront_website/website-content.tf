locals {
  mime_types = jsondecode(file("${path.module}/data/mime.json"))
}

resource "aws_s3_bucket_object" "website_files" {
  for_each      = fileset(var.upload_directory, "**/*.*")
  bucket        = aws_s3_bucket.s3_bucket.bucket
  key           = replace(each.value, var.upload_directory, "")
  source        = "${var.upload_directory}/${each.value}"
  acl           = "public-read"
  etag          = filemd5("${var.upload_directory}/${each.value}")
  content_type  = lookup(local.mime_types, split(".", each.value)[length(split(".", each.value)) - 1])
}