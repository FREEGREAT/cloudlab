locals {
  tag_name = var.use_locals ? "forum" : var.bucket_name
}



module "table_author"{
    source = "./modules/dynamodb"
    context = module.label.context
    name = "authors"
}
module "table_courses" {
  source  = "./modules/dynamodb"
  context = module.label.context
  name    = "courses"
}



module "lambda" {
  source                   = "./modules/lambda"
  context                  = module.label.context
  table_authors_name       = module.table_author.id
  role_get_all_authors_arn = module.iam.role_get_all_authors_arn
  table_courses_name       = module.table_courses.id
  role_get_all_courses_arn = module.iam.role_get_all_courses_arn
  role_get_course_arn      = module.iam.role_get_course_arn
  role_save_course_arn     = module.iam.role_save_course_arn
  role_update_course_arn   = module.iam.role_save_course_arn
  role_delete_course_arn   = module.iam.role_delete_course_arn
  aws_api_gateway_rest_api_execution_arn = aws_api_gateway_rest_api.this.execution_arn
}

module "iam" {
  source                                   = "./modules/iam"
  context                                  = module.label.context
  table_authors_arn                        = module.table_author.arn
  cloudwatch_log_group_get_all_authors_arn = module.cloudwatch.cloudwatch_log_group_get_all_authors_arn
  table_courses_arn                        = module.table_courses.arn
  cloudwatch_log_group_get_all_courses_arn = module.cloudwatch.cloudwatch_log_group_get_all_courses_arn
  cloudwatch_log_group_get_course_arn      = module.cloudwatch.cloudwatch_log_group_get_course_arn
  cloudwatch_log_group_save_course_arn     = module.cloudwatch.cloudwatch_log_group_save_course_arn
  cloudwatch_log_group_update_course_arn   = module.cloudwatch.cloudwatch_log_group_update_course_arn
  cloudwatch_log_group_delete_course_arn   = module.cloudwatch.cloudwatch_log_group_delete_course_arn
}

module "cloudwatch" {
  source  = "./modules/cloudwatch"
  context = module.label.context
}

