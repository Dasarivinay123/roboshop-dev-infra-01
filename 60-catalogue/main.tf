resource "aws_instance" "catalogue" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  # Pass the security group ID as a list
  vpc_security_group_ids = [local.catalogue_sg_id]
  subnet_id              = local.private_subnet_id
  #   key_name               = "daws-key"
  #   user_data = templatefile("${path.module}/bastion.sh.tftpl", {
  #     partition_number = 4
  #     extend_size      = 30
  #   })
  tags = merge(
    {
      Name = "${local.common_name}-catalogue"
    },
    local.common_tags
  )
}