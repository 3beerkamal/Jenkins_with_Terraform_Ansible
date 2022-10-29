terraform {
  backend "s3" {
    bucket = "abeer-bucket"
    key    = "terraform-project/"
    region = "us-east-1"
    dynamodb_table = "iti"
  }
}