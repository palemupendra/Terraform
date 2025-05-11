# terraform {
#     backend "s3" {
#         bucket         = "prod-terraform-state-bucket"
#         key            = "terraform/state/production/terraform.tfstate"
#         region         = "us-east-1"
#         encrypt        = true
#         dynamodb_table = "prod-terraform-lock-table"
#     }
# }