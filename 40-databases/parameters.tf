resource "aws_ssm_parameter" "mysql_root_password" {
  name      = "/${var.project}/${var.environment}/mysql_root_password"
  type      = "SecureString"
  value     = var.mysql_root_password
  overwrite = true
}
