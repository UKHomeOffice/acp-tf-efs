# acp-tf-efs

Terraform module to provision and manage EFS, EFS mount target, and security group for ingress traffic.

## Module Usage

```
module "efs" {
  source      = "git::https://github.com/UKHomeOffice/acp-tf-efs?ref=master"
  environment = var.environment
  name        = var.name
  region      = var.region  
  subnet_ids  = var.subnet_ids
  vpc_id      = var.vpc_id  
}

You can control ingress traffic by adding security group rules to whitelist VPC cidr blocks or another security group e.g.

resource "aws_security_group_rule" "allow_inbound_efs_from_VPC" {
  type              = "ingress"
  from_port         = 2049
  to_port           = 2049
  protocol          = "tcp"
  cidr_blocks       = [var.cidr_blocks]
  security_group_id = module.efs.security_group_id
}

resource "aws_security_group_rule" "allow_inbound_efs_from_SG" {
  type                     = "ingress"
  from_port                = 2049
  to_port                  = 2049
  protocol                 = "tcp"
  source_security_group_id = var.source_security_group_id
  security_group_id        = module.efs.security_group_id
}

Note: Variables above need to be declared and assigned appropriate values e.g. variable "region" { default = "eu-west-2" }.
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| encrypted | Enable encryption at rest. | `bool` | `false` | no |
| environment | The environment the Elastic File System is running in e.g. dev, prod etc. | `string` | n/a | yes |
| kms\_key\_id | If encrypted is set to true, a KMS encryption key ARN can be specified. | `string` | `""` | no |
| name | An optional unique name for the Elastic File System. | `string` | n/a | yes |
| performance\_mode | The file system performance mode. | `string` | `"generalPurpose"` | no |
| provisioned\_throughput\_in\_mibps | The throughput, measured in MiB/s, for the file system. Only applicable with throughput\_mode set to provisioned. | `string` | `"0"` | no |
| region | The region in which to provision all the AWS resources in this module. | `string` | n/a | yes |
| security\_groups\_ids | A list of up to 5 VPC security group IDs (that must be for the same VPC as subnet specified) in effect for the mount target. | `list(string)` | `[]` | no |
| subnet\_ids | The ID of the subnet to add the mount target in. | `list(string)` | n/a | yes |
| tags | An optional map of tags to associate with the AWS resources to be provisioned. | `map` | `{}` | no |
| throughput\_mode | Throughput mode for the file system. | `string` | `"bursting"` | no |
| transition\_to\_ia | Indicates how long it takes to transition files to the IA storage class. | `string` | `""` | no |
| vpc\_id | The ID of the VPC to add the security group in. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arn | Amazon Resource Name of the file system. |
| dns\_name | The DNS name for the filesystem. |
| id | The ID that identifies the file system. |
| security\_group\_id | The ID of the security group associated with the EFS mount target. |
