variable "vpc_id" {
    description = "The ID of the VPC where the security group will be created"
    type        = string
}

variable "security_group_name" {
    description = "The name of the security group"
    type        = string
    default     = "default-security-group"
}

variable "ingress_rules" {
    description = "A list of ingress rules for the security group"
    type        = list(object({
        from_port   = number
        to_port     = number
        protocol    = string
        cidr_blocks = list(string)
    }))
    default = []
}

variable "egress_rules" {
    description = "A list of egress rules for the security group"
    type        = list(object({
        from_port   = number
        to_port     = number
        protocol    = string
        cidr_blocks = list(string)
    }))
    default = []
}

variable "tags" {
    description = "A map of tags to assign to the security group"
    type        = map(string)
    default     = {}
}