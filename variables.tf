variable "region" {
  type        = string
  description = "The region in which to provision all the AWS resources in this module."
}

variable "name" {
  type        = string
  description = "An optional unique name for the Elastic File System."
}

variable "environment" {
  type        = string
  description = "The environment the Elastic File System is running in e.g. dev, prod etc."
}

variable "encrypted" {
  type        = bool
  default     = false
  description = "Enable encryption at rest."
}

variable "kms_key_id" {
  type        = string
  default     = ""
  description = "If encrypted is set to true, a KMS encryption key ARN can be specified."
}

variable "performance_mode" {
  type        = string
  default     = "generalPurpose"
  description = "The file system performance mode."
}

variable "provisioned_throughput_in_mibps" {
  type        = string
  default     = "0"
  description = "The throughput, measured in MiB/s, for the file system. Only applicable with throughput_mode set to provisioned."
}

variable "throughput_mode" {
  type        = string
  default     = "bursting"
  description = " Throughput mode for the file system."
}

variable "tags" {
  type        = map
  default     = {}
  description = "An optional map of tags to associate with the AWS resources to be provisioned."
}

variable "transition_to_ia" {
  type        = string
  default     = ""
  description = "Indicates how long it takes to transition files to the IA storage class."
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC to add the security group in."
}

variable "subnet_ids" {
  type        = list(string)
  description = "The ID of the subnet to add the mount target in."
}

variable "security_group_ids" {
  type        = list(string)
  default     = []
  description = "A list of up to 5 VPC security group IDs (that must be for the same VPC as subnet specified) in effect for the mount target."
}
