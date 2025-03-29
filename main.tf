resource "aws_s3_bucket" "my_s3_bucket" {
    bucket = var.bucket_name
}


resource "aws_s3_bucket_public_access_block" "public" {
    bucket = aws_s3_bucket.my_s3_bucket.bucket
    block_public_acls = true
    block_public_policy = true
    ignore_public_acls = true 
    restrict_public_buckets = true
}


resource "aws_s3_object" "object1" {
    bucket = aws_s3_bucket.my_s3_bucket.bucket
    key = "index.html"
    source = "./index.html"

}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.my_s3_bucket.bucket

  index_document {
    suffix = "index.html"
  }
}
