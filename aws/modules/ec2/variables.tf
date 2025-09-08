variable "ec2_instances" {
  type = list(object({
    ec2_ami                = string
    ec2_instance_type      = string
    ec2_subnet_id          = string
    ec2_sg                 = list(string)
    ec2_public_ip          = bool
    ec2_user_data          = optional(string)
    ec2_name               = string
    create_key_pair        = bool
    ec2_key_pair_name      = optional(string)
    private_key_algo       = optional(string)
    rsa_bits               = optional(string)
    private_key_location   = optional(string)
    private_key_permission = optional(string)
  }))
}