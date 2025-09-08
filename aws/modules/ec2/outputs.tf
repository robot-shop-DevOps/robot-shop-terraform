output "ec2_arn" {
  value = [for ec2 in aws_instance.ec2_instance : ec2.arn]
}

output "ec2_id" {
  value = [for ec2 in aws_instance.ec2_instance : ec2.id]
}

output "ec2_public_ip" {
  value = [for ec2 in aws_instance.ec2_instance : ec2.public_ip]
}