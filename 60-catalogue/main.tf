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
resource "terraform_data" "catalogue" {
  triggers_replace = [
    aws_instance.catalogue.id
  ]
  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.catalogue.private_ip
  }
  provisioner "file" {
    source      = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh catalogue ${var.environment}"
    ]
  }
}