output "sg_arn" {
  value = [for sg in aws_security_group.security_group : sg.arn]
}

output "sg_id" {
  value = [for sg in aws_security_group.security_group : sg.id]
}