resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  //acl    = "private"

  //versioning {
  //  enabled = true
  //}

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_acl" "bucket-acl" {
  bucket = aws_s3_bucket.bucket.id
  acl = "private"
}
resource "aws_dynamodb_table" "this" {
  name         = var.table_name
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}
