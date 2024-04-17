locals {
  tag_name = "forum"
}



module "s3"{
    source = "./modules/s3"
    bucket_name = "730335325958-my-tf-test-bucket-s3-module"
    use_locals = true
}

module "table_author"{
    source = "./modules/dynamodb"
    context = module.label.context
    name = "authors"
}

module "lambdas"{
    source = "./modules/lambda"
    context = module.label.context
    table_authors_name = module.table_author.id
    table_courses_name = "courses"
}


