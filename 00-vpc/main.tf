module "vpc" {
    source = "git::https://github.com/Dasarivinay123/terraform-aws-vpc-practice.git?ref=main"
    project =  var.project_name
    environment = var.env
    is_peering_required = false
}