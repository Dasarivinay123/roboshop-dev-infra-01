module "sg" {
    count = length(var.sg_names)
    source = "git::https://github.com/Dasarivinay123/terraform-aws-sg.git?ref=main"
    project =  var.project
    environment = var.environment
    vpc_id = local.vpc_id
    sg_name = var.sg_names[count.index]
}