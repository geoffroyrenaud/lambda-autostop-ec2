# lambda-autostop-ec2
AWS Lambda to schedule auto stop ec2 instances

## Introduction

This lambda is used to schedule automatic shutdown on each instances on each regions if a specifig tag like AutoStop=no is not present.
Very usefull in Dev or Sandbox environnement

## Deployment

### Terraform

This examples shows how to deploy this lambda function using Terraform.
To run, configure your AWS provider as described in https://www.terraform.io/docs/providers/aws/index.html
Running the deployment example
Run `terraform init && terraform apply` to see it work.

### Cloudformation

### AWS Serverless Application Model (SAM)

### Serverless

