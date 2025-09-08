resource "aws_instance" "ec2_instance" {
  count                       = length(var.ec2_instances)
  ami                         = var.ec2_instances[count.index].ec2_ami
  instance_type               = var.ec2_instances[count.index].ec2_instance_type
  subnet_id                   = var.ec2_instances[count.index].ec2_subnet_id
  vpc_security_group_ids      = var.ec2_instances[count.index].ec2_sg
  associate_public_ip_address = var.ec2_instances[count.index].ec2_public_ip
  key_name                    = var.ec2_instances[count.index].ec2_key_pair_name
  user_data                   = var.ec2_instances[count.index].ec2_user_data

  tags = {
    Name = var.ec2_instances[count.index].ec2_name
  }
}

resource "aws_key_pair" "name" {
  for_each = {
    for ec2 in var.ec2_instances : ec2.ec2_name => ec2
    if ec2.create_key_pair
  }
  key_name   = each.value.ec2_key_pair_name
  public_key = tls_private_key.tls_private_key[each.key].public_key_openssh
}

resource "local_file" "private_key_pem" {
  for_each = {
    for ec2 in var.ec2_instances : ec2.ec2_name => ec2
    if ec2.create_key_pair
  }
  content         = tls_private_key.tls_private_key[each.key].private_key_pem
  filename        = each.value.private_key_location
  file_permission = each.value.private_key_permission
}

resource "tls_private_key" "tls_private_key" {
  for_each = {
    for ec2 in var.ec2_instances : ec2.ec2_name => ec2
    if ec2.create_key_pair
  }

  algorithm = each.value.private_key_algo
  rsa_bits  = each.value.rsa_bits
}