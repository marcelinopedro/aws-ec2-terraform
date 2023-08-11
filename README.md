# aws-ec2-terraform
Projeto Terraform feito em colaboração com GustavoXayk

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> Terraform | > 1.0.0 |
| <a name="requirement_aws"></a> AWS | ~> 4.51.0 |

## Services used

| Name |
|------|
| <a name="requirement_aws"></a> EC2 |
| <a name="requirement_aws"></a> S3 |
| <a name="requirement_aws"></a> ROUTE 53 |
| <a name="requirement_aws"></a> IAM |

## About

| Description |
|-------------|
EC2 used to create an instance and configure the security group rules<br> 
S3 used as a database for the EC2 instance<br>
Route 53 used as DNS for the EC2 instance IP<br>
IAM used to configure security policies<br>
