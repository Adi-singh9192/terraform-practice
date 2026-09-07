# This is for the creating the bucket

resource "aws_s3_bucket" "my-demo-bucket" {
    bucket = "remote-s3-bucket-practice"

    force_destroy = true

    tags = {
        Name = "My_S3_bucket"
        Environment = "dev"
    }
}