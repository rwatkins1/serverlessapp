resource "aws_s3_bucket" "bucketname" {
  bucket = var.bucketname 
}

resource "aws_s3_bucket_ownership_controls" "bucketname" {
  bucket = aws_s3_bucket.bucketname.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "bucketname" {
  bucket = aws_s3_bucket.bucketname.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "bucketname" {
  depends_on = [
    aws_s3_bucket_ownership_controls.bucketname,
    aws_s3_bucket_public_access_block.bucketname,
  ]

  bucket = aws_s3_bucket.bucketname.id
  acl    = "public-read"
}
resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.bucketname.id
  key    = "index.html"
  source = "index.html"
  acl = "public-read"
  content_type = "text/html"
}


resource "aws_s3_object" "style" {
  bucket = aws_s3_bucket.bucketname.id
  key    = "style.css"
  source = "style.css"
  content_type = "text/css"
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.bucketname.id

  index_document {
    suffix = "index.html"

  }
}