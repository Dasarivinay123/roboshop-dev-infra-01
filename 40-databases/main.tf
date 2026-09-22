resource "aws_instance" "mongodb" {
  ami           = data.aws_ami.joindevops.id
  instance_type = "t3.micro"
  # Pass the security group ID as a list
  vpc_security_group_ids = [local.mongodb_sg_id]
  subnet_id              = local.databse_subnet_id
  #   key_name               = "daws-key"
  #   user_data = templatefile("${path.module}/bastion.sh.tftpl", {
  #     partition_number = 4
  #     extend_size      = 30
  #   })
  tags = merge(
    {
      Name = "${local.common_name}-bastion"
    },
    local.common_tags
  )
}
resource "terraform_data" "mongodb" {
  triggers_replace = [
    aws_instance.mongodb.id
  ]
  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.mongodb.private_ip
  }
  provisioner "file" {
    source = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }
  provisioner "remote-exec" {
   inline = [ 
        "chmod +x /tmp/bootstrap.sh",
        "sudo sh /tmp/bootstrap.sh momgodb ${var.var.environment}"
    ]
  }
}
