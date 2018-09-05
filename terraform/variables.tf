variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-east-1"
}

variable "lambda_src_code" {
  default = "AutoStop.py"
}

variable "schedule_expression" {
  description = "Schedule for lambda execution"
  default = "cron(0 20 * * ? *)"
}
