resource "aws_iam_role" "mysql" {
  name = "${local.common_name}-mysql"

  # This is the trust Poliocy, means we can atach this role to EC2 instance
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = merge(
    {
      Name = "${local.common_name}-mysql"
    },
    local.common_tags
  )
}

resource "aws_iam_policy" "mysql" {
  name        = "${local.common_name}-mysql"
  description = "Policy to read mysql SSM parameter to attach to mysql instance"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = file("mysql-iam-policy.json")
}

resource "aws_iam_role_policy_attachment" "mysql" {
  role       = aws_iam_role.role.mysql
  policy_arn = aws_iam_policy.mysql.arn
}

resource "aws_iam_instance_profile" "mysql" {
  name = "${local.common_name}-mysql"
  role = aws_iam_role.mysql.name
}