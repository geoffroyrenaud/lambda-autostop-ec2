# lambda-autostop-ec2
AWS Lambda to schedule auto stop ec2 instances

## Introduction

This lambda is used to schedule automatic shutdown on each instances on each regions if a specifig tag like AutoStop=no is not present.
Very usefull in Dev or Sandbox environnement

## Deployment

### Terraform

This examples shows how to deploy this lambda function using Terraform.
To run, you need to configure :
- Edit terraform/main.tf wuth your AWS provider parameters as described in https://www.terraform.io/docs/providers/aws/index.html
- Edit terraform/variables.tf for schedule CloudWatch Event
- Running the deployment example : 
  - Run `terraform init && terraform apply` to see it work.
Destroy Environnement :
- To remove the stack: `terraform destroy`

### Cloudformation

TODO

### AWS Serverless Application Model (SAM)

TODO

### Serverless

TODO
