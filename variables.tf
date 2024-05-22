variable "bucket_name" {
  type = string
  #   default = "891377012449-my-tf-test-bucket"
}

variable "slack_webhook_url" {
  type = string
}

variable "slack_email" {
  type = string
}



variable "use_locals" {
  type    = bool
  default = true
}