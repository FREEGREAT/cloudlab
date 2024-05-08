module "label" {
  source = "cloudposse/label/null"
  version = "0.25.0"
  context = var.context
}
/* AUTHOR */
module "label_get_all_authours" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = module.label.context
  name = "get-all-authoors"
}
module "label_delete_item" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = module.label.context
  name = "delete-item-author"
}
module "label_create_item" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = module.label.context
  name = "create-item-author"
}
module "label_update_item" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = module.label.context
  name = "update-item-author"
}
module "label_get_item" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = module.label.context
  name = "get-item-author"
}



module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"

  function_name = module.label_get_all_authours.id
  description   = "My awesome lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"
  create_role = false
  lambda_role = "arn:aws:iam::730335325958:role/get-all-authors-lambda-role"

  source_path = "${path.module}/src/get_all_authors"

  environment_variables = {
    TABLE_NAME = var.table_authors_name
  }

  tags = module.label_get_all_authours.tags
}

module "lambda_function_delete" {
  source = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"

  function_name = module.label_delete_item.id
  description   = "My delete lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"
  create_role = false
  lambda_role = "arn:aws:iam::730335325958:role/delete-item-authors-lambda-role"

  source_path = "${path.module}/src/delete_item_authors"

  environment_variables = {
    TABLE_NAME = var.table_authors_name
  }

  tags = module.label_delete_item.tags
}
module "lambda_function_create" {
  source = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"

  function_name = module.label_create_item.id
  description   = "My create lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"
  create_role = false
  lambda_role = "arn:aws:iam::730335325958:role/put-item-authors-lambda-role"

  source_path = "${path.module}/src/create_item_authors"

  environment_variables = {
    TABLE_NAME = var.table_authors_name
  }

  tags = module.label_create_item.tags
}
module "lambda_function_update" {
  source = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"

  function_name = module.label_update_item.id
  description   = "My update lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"
  create_role = false
  lambda_role = "arn:aws:iam::730335325958:role/update-item-authors-lambda-role"
  
  source_path = "${path.module}/src/update_item_authors"

  environment_variables = {
    TABLE_NAME = var.table_authors_name
  }
  tags = module.label_update_item.tags
}

module "lambda_function_get" {
  source = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"

  function_name = module.label_get_item.id
  description   = "Get item lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"
  create_role = false
  lambda_role = "arn:aws:iam::730335325958:role/get-item-authors-lambda-role"

  source_path = "${path.module}/src/get_item_authors"

  environment_variables = {
    TABLE_NAME = var.table_authors_name
  }

  tags = module.label_get_item.tags
}

/*COURSES*/

module "label_get_all_courses" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = module.label.context
  name = "get-all-courses"
}
module "label_delete_item_courses" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = module.label.context
  name = "delete-item-courses"
}
module "label_create_item_courses" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = module.label.context
  name = "create-item-courses"
}
module "label_update_item_courses" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = module.label.context
  name = "update-item-courses"
}
module "label_get_item_courses" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = module.label.context
  name = "get-item-courses"
}



module "lambda_function_courses" {
  source = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"

  function_name = module.label_get_all_courses.id
  description   = "My awesome lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"
  create_role = false
  lambda_role = "arn:aws:iam::730335325958:role/get-all-courses-role"

  source_path = "${path.module}/src/get_all_courses"

  environment_variables = {
    TABLE_NAME = var.table_courses_name
  }

  tags = module.label_get_all_courses.tags
}

module "lambda_function_delete_courses" {
  source = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"

  function_name = module.label_delete_item_courses.id
  description   = "My delete lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"
  create_role = false
  lambda_role = "arn:aws:iam::730335325958:role/delete-item-authors-lambda-role"

  source_path = "${path.module}/src/delete_item_courses"

  environment_variables = {
    TABLE_NAME = var.table_courses_name
  }

  tags = module.label_delete_item_courses.tags
}
module "lambda_function_create_courses" {
  source = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"

  function_name = module.label_create_item_courses.id
  description   = "My create lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"
  create_role = false
  lambda_role = "arn:aws:iam::730335325958:role/put-item-courses-role"

  source_path = "${path.module}/src/create_item_courses"

  environment_variables = {
    TABLE_NAME = var.table_courses_name
  }

  tags = module.label_create_item_courses.tags
}
module "lambda_function_update_courses" {
  source = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"

  function_name = module.label_update_item_courses.id
  description   = "My update lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"
  create_role = false
  lambda_role = "arn:aws:iam::730335325958:role/update-item-authors-lambda-role"
  
  source_path = "${path.module}/src/update_item_courses"

  environment_variables = {
    TABLE_NAME = var.table_courses_name
  }
  tags = module.label_update_item_courses.tags
}

module "lambda_function_get_courses" {
  source = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"

  function_name = module.label_get_item_courses.id
  description   = "Get item lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"
  create_role = false
  lambda_role = "arn:aws:iam::730335325958:role/get-item-authors-lambda-role"

  source_path = "${path.module}/src/get_item_courses"

  environment_variables = {
    TABLE_NAME = var.table_courses_name
  }

  tags = module.label_get_item_courses.tags
}

