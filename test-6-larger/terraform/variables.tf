variable "public_key_path" {
  description = <<DESCRIPTION
Path to the SSH public key to be used for authentication.
Ensure this keypair is added to your local SSH agent so provisioners can
connect.
Example: ~/.ssh/terraform.pub
DESCRIPTION
}

variable "private_key_path" {
  description = "Path to SSH private key corresponding to the public key in public_key_path"
}

variable "cert_owner" {
  description = "The OS user to be made the owner of the local copy of the vault certificates. Should usually be set to the user operating the tool."
}

variable "force_destroy_s3_buckets" {
  description = "Whether or not to force destroy s3 buckets. Set to true for an easily destroyed test environment. DO NOT set to true for a production environment."
}

variable "generate_metrics" {
  description = "Whether or not to generate CloudWatch metrics from the cluster. Set to false to disable for cost savings."
}

variable "vault_cluster_size" {
  description = "The number of instances to use in the vault cluster"
}

variable "vault_instance_type" {
  description = "The EC2 instance type to use for vault nodes"
}

variable "consul_cluster_size" {
  description = "The number of instances to use in the consul cluster"
}

variable "consul_instance_type" {
  description = "The EC2 instance type to use for consul nodes"
}

variable "vault_amis" {
  description = "Mapping from AWS region to AMI ID to use for vault nodes in that region"
  type        = "map"
}

variable "quorum_amis" {
  description = "Mapping from AWS region to AMI ID to use for quorum nodes in that region"
  type        = "map"
}

variable "bootnode_amis" {
  description = "Mapping from AWS region to AMI ID to use for bootnodes in that region"
  type        = "map"
}
