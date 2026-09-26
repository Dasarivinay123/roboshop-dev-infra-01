resource "aws_instance" "vpn" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.vpn_sg_id]
  subnet_id = local.public_subnet_id
  user_data = file("vpn.sh")

  tags = merge(
    {
        Name = "${local.common_name}-vpn"
    },
    local.common_tags
  )
}