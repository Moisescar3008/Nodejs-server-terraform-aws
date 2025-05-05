resource "aws_s3_bucket" "tf_s3_bucketmoy" {
  bucket = "bucket-name"

  tags = {
    Name        = "Nodejs terraform bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_object" "tf_s3_objectmoy" {
  bucket = aws_s3_bucket.tf_s3_bucketmoy.bucket
  for_each = fileset("../public/images", "**")# search files that are at the images folder
  key    = "images/${each.key}"
  source = "../public/images/${each.key}"
}