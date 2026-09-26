#  Mongodb allowing connections from catalogue on port 27017
resource "aws_security_group_rule" "mongodb_catalogue" {
  type                     = "ingress"
  from_port                = 27017
  to_port                  = 27017
  protocol                 = "tcp"
  source_security_group_id = local.catalogue_sg_id
  security_group_id        = local.mongodb_sg_id
}

#  Mongodb allowing connections from user on port 27017
resource "aws_security_group_rule" "mongodb_user" {
  type                     = "ingress"
  from_port                = 27017
  to_port                  = 27017
  protocol                 = "tcp"
  source_security_group_id = local.user_sg_id
  security_group_id        = local.mongodb_sg_id
}


#  Mongodb allowing connections from bastion on port 22
resource "aws_security_group_rule" "mongodb_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = local.bastion_sg_id
  security_group_id        = local.mongodb_sg_id
}

#  Redis allowing connections from user on port 6379
resource "aws_security_group_rule" "redis_user" {
  type                     = "ingress"
  from_port                = 6379
  to_port                  = 6379
  protocol                 = "tcp"
  source_security_group_id = local.user_sg_id
  security_group_id        = local.redis_sg_id
}

#  Redis allowing connections from cart on port 6379
resource "aws_security_group_rule" "redis_cart" {
  type                     = "ingress"
  from_port                = 6379
  to_port                  = 6379
  protocol                 = "tcp"
  source_security_group_id = local.cart_sg_id
  security_group_id        = local.redis_sg_id
}


#  Redis allowing connections from bastion on port 22
resource "aws_security_group_rule" "redis_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = local.bastion_sg_id
  security_group_id        = local.redis_sg_id
}

#  mysql allowing connections from shipping on port 3306
resource "aws_security_group_rule" "mysql_shipping" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = local.shipping_sg_id
  security_group_id        = local.mysql_sg_id
}
#  mysql allowing connections from bastion on port 22
resource "aws_security_group_rule" "mysql_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = local.bastion_sg_id
  security_group_id        = local.mysql_sg_id
}

#  Rabbitmq allowing connections from payment on port 5672
resource "aws_security_group_rule" "rabbitmq_payment" {
  type                     = "ingress"
  from_port                = 5672
  to_port                  = 5672
  protocol                 = "tcp"
  source_security_group_id = local.payment_sg_id
  security_group_id        = local.rabbitmq_sg_id
}

#  Rabbitmq allowing connections from bastion on port 22
resource "aws_security_group_rule" "rabbitmq_bastiont" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = local.bastion_sg_id
  security_group_id        = local.rabbitmq_sg_id
}

#  catalogue allowing connections from backend_alb on port 8080
resource "aws_security_group_rule" "catalogue_backend_alb" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = local.backend_alb_sg_id
  security_group_id        = local.catalogue_sg_id
}

#  catalogue allowing connections from bastion on port 22
resource "aws_security_group_rule" "catalogue_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = local.bastion_sg_id
  security_group_id        = local.catalogue_sg_id
}

#  user allowing connections from backend_alb on port 8080
resource "aws_security_group_rule" "user_backend_alb" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = local.backend_alb_sg_id
  security_group_id        = local.user_sg_id
}

#  user allowing connections from bastion on port 22
resource "aws_security_group_rule" "user_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = local.bastion_sg_id
  security_group_id        = local.user_sg_id
}

#  cart allowing connections from backend_alb on port 8080
resource "aws_security_group_rule" "cart_backend_alb" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = local.backend_alb_sg_id
  security_group_id        = local.cart_sg_id
}

#  cart allowing connections from bastion on port 22
resource "aws_security_group_rule" "cart_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = local.bastion_sg_id
  security_group_id        = local.cart_sg_id
}

#  shipping allowing connections from backend_alb on port 8080
resource "aws_security_group_rule" "shipping_backend_alb" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = local.backend_alb_sg_id
  security_group_id        = local.shipping_sg_id
}

#  shipping allowing connections from bastion on port 22
resource "aws_security_group_rule" "shipping_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = local.bastion_sg_id
  security_group_id        = local.shipping_sg_id
}

#  payment allowing connections from backend_alb on port 8080
resource "aws_security_group_rule" "payment_backend_alb" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = local.backend_alb_sg_id
  security_group_id        = local.payment_sg_id
}

#  payment allowing connections from bastion on port 22
resource "aws_security_group_rule" "payment_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = local.bastion_sg_id
  security_group_id        = local.payment_sg_id
}

#  backend_alb allowing connections from frontend on port 80
resource "aws_security_group_rule" "backend_alb_frontend" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = local.frontend_sg_id
  security_group_id        = local.backend_alb_sg_id
}

#  backend_alb allowing connections from bastion on port 80
resource "aws_security_group_rule" "backend_alb_bastion" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = local.bastion_sg_id
  security_group_id        = local.backend_alb_sg_id
}

resource "aws_security_group_rule" "backend_alb_vpn" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = local.vpn_sg_id
  security_group_id = local.backend_alb_sg_id
}

#  backend_alb allowing connections from catalogue on port 80
resource "aws_security_group_rule" "backend_alb_catalogue" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = local.catalogue_sg_id
  security_group_id        = local.backend_alb_sg_id
}

#  backend_alb allowing connections from user on port 80
resource "aws_security_group_rule" "backend_alb_user" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = local.user_sg_id
  security_group_id        = local.backend_alb_sg_id
}

#  backend_alb allowing connections from cart on port 80
resource "aws_security_group_rule" "backend_alb_cart" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = local.cart_sg_id
  security_group_id        = local.backend_alb_sg_id
}

#  backend_alb allowing connections from shipping on port 80
resource "aws_security_group_rule" "backend_alb_shipping" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = local.shipping_sg_id
  security_group_id        = local.backend_alb_sg_id
}

#  backend_alb allowing connections from payment on port 80
resource "aws_security_group_rule" "backend_alb_payment" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = local.payment_sg_id
  security_group_id        = local.backend_alb_sg_id
}

#  frontend allowing connections from frontend_alb on port 80
resource "aws_security_group_rule" "frontend_frontend_alb" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = local.frontend_alb_sg_id
  security_group_id        = local.frontend_sg_id
}

#  frontend allowing connections from bastion on port 22
resource "aws_security_group_rule" "frontend_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = local.bastion_sg_id
  security_group_id        = local.frontend_sg_id
}

#  frontend_alb allowing connections from https on port 443
resource "aws_security_group_rule" "frontend_alb_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = local.frontend_alb_sg_id
}

#  frontend_alb allowing connections from http on port 80
resource "aws_security_group_rule" "frontend_alb_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = local.frontend_alb_sg_id
}

# #  bastion allowing connections from myip
# resource "aws_security_group_rule" "bastion_my_public_ip" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
#   security_group_id = local.bastion_sg_id
# }

resource "aws_security_group_rule" "bastion_my_public_ip" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks = ["3.237.177.111/32"]
  #source_security_group_id = local.vpn_sg_id
  security_group_id = local.bastion_sg_id
}
# VPN
resource "aws_security_group_rule" "vpn_public_1194" {
  type              = "ingress"
  from_port         = 1194
  to_port           = 1194
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = local.vpn_sg_id
}

resource "aws_security_group_rule" "vpn_public_943" {
  type              = "ingress"
  from_port         = 943
  to_port           = 943
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = local.vpn_sg_id
}

resource "aws_security_group_rule" "vpn_public_443" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = local.vpn_sg_id
}

resource "aws_security_group_rule" "vpn_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = local.vpn_sg_id
}