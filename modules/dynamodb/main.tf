
module "label" {
  source   = "cloudposse/label/null"
  version = "0.25.0"

  context = var.context

  name = var.name

}

resource "aws_dynamodb_table" "this" {
  name           = "authors"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }

}

resource "aws_dynamodb_table" "courses" {
  name           = "courses"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }

}