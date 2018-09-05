# Specify the provider and access details
provider "aws" {
  region = "${var.aws_region}"
}

provider "archive" {}

data "archive_file" "zip" {
  type        = "zip"
  source_file = "${path.root}/${var.lambda_src_code}"
  output_path = "${path.root}/${var.lambda_src_code}.zip"
}

resource "aws_lambda_function" "lambda" {
  function_name = "autostop-ec2"

  filename         = "${data.archive_file.zip.output_path}"
  source_code_hash = "${data.archive_file.zip.output_sha}"

  role    = "${aws_iam_role.iam_for_lambda.arn}"
  handler = "hello_lambda.lambda_handler"
  runtime = "python3.6"
  timeout = 30

  lifecycle {
    ignore_changes = ["filename", "last_modified"]
  }
  
  environment {
    variables = {
      AutoStop = "no"
    }
  }
}
