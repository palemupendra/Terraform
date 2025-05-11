resource "aws_security_group" "example" {
  name        = "example-sg"
  description = "Example security group"
  vpc_id      = "vpc-0a95db94dcbda312c" # Replace with your VPC ID
}

# List of ports to allow
variable "allowed_ports" {
  type    = list(string)
  //description = "values to allow"
  default = ["22", "80", "443"]
}

resource "aws_security_group_rule" "allow_ports" {
  //for_each = toset([for p in var.allowed_ports : tostring(p)])
  for_each = toset(var.allowed_ports)
  type              = "ingress"
  from_port         = each.value
  to_port           = each.value
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.example.id
}