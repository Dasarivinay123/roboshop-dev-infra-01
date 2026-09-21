resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project_name}/${var.env}/vpc-id"
  type  = "String"
  value = module.vpc.vpc_id
  overwrite = true
}
resource "aws_ssm_parameter" "public_subnet_ids" {
  name  = "/${var.project_name}/${var.env}/public-subnet-ids"
  type  = "String"
  value = join(",", module.vpc.public_subnet_ids)
  overwrite = true
}
resource "aws_ssm_parameter" "private_subnet_ids" {
  name  = "/${var.project_name}/${var.env}/private-subnet-ids"
  type  = "String"
  value = join(",", module.vpc.private_subnet_ids)          
  overwrite = true
}
resource "aws_ssm_parameter" "database_subnet_ids" {
  name  = "/${var.project_name}/${var.env}/database-subnet-ids"
  type  = "String"
  value = join(",", module.vpc.database_subnet_ids) 
  overwrite = true
}