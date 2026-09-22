locals {
  mongodb_sg_id     = data.aws_ssm_parameter.mongodb_sg_id.value
  redis_sg_id       = data.aws_ssm_parameter.redis_sg_id.value
  common_name       = "${var.project}-${var.environment}"
  ami_id            = data.aws_ami.joindevops.id
  databse_subnet_id = split(",", data.aws_ssm_parameter.database_subnet_ids.value)[0] #roboshop-dev-public-subnet-1a
  common_tags = {
    Project     = "${var.project}"
    Environment = "${var.environment}"
    Terraform   = "true"
  }
}
