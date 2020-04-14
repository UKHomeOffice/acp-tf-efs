module "demo_efs" {
  source      = "git::https://github.com/UKHomeOffice/acp-tf-efs?ref=master"
  region      = "eu-west-2"
  environment = "dev"
  vpc_id      = "vpc-2c882045"
  name        = "demo-efs"
  subnet_ids  = ["subnet-8b529fe2", "subnet-961dc0ed", "subnet-af8a7ee2"]
}

output "efs_arn" {
  value       = module.demo_efs.arn
  description = "Amazon Resource Name of the file system."
}

output "efs_id" {
  value       = module.demo_efs.id
  description = "The ID that identifies the file system."
}

output "efs_dns_name" {
  value       = module.demo_efs.dns_name
  description = "The DNS name for the filesystem."
}

output "security_group_id" {
  value       = module.demo_efs.security_group_id
  description = "The ID of the security group associated with the EFS mount target."
}
