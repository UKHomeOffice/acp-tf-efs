output "arn" {
  value       = aws_efs_file_system.efs.arn
  description = "Amazon Resource Name of the file system."
}

output "id" {
  value       = aws_efs_file_system.efs.id
  description = "The ID that identifies the file system."
}

output "dns_name" {
  value       = aws_efs_file_system.efs.dns_name
  description = "The DNS name for the filesystem."
}

output "security_group_id" {
  value       = aws_security_group.efs_ingress.id
  description = "The ID of the security group associated with the EFS mount target."
}
