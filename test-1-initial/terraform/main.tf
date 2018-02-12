module "quorum_cluster" {
  source = "github.com/Eximchain/terraform-aws-quorum-cluster.git//terraform/modules/quorum-cluster?ref=v0.1.3-beta"

  # AMI variables sourced from amis.auto.tfvars.json
  quorum_amis   = "${var.quorum_amis}"
  vault_amis    = "${var.vault_amis}"
  bootnode_amis = "${var.bootnode_amis}"

  # Common variables sourced from terraform.tfvars
  public_key_path  = "${var.public_key_path}"
  private_key_path = "${var.private_key_path}"
  cert_owner       = "${var.cert_owner}"

  force_destroy_s3_buckets = "${var.force_destroy_s3_buckets}"
  generate_metrics         = "${var.generate_metrics}"

  vault_cluster_size   = "${var.vault_cluster_size}"
  vault_instance_type  = "${var.vault_instance_type}"
  consul_cluster_size  = "${var.consul_cluster_size}"
  consul_instance_type = "${var.consul_instance_type}"

  # Cluster specific variables
  network_id = 881

  gas_limit      = 804247552
  vote_threshold = 4
  min_block_time = 60
  max_block_time = 300

  primary_region = "us-east-1"

  bootnode_instance_type    = "t2.small"
  quorum_node_instance_type = "t2.medium"

# 8 Bootnodes across 8 Regions
  bootnode_counts       = {
    us-east-1      = 1
    us-east-2      = 1
    us-west-1      = 0
    us-west-2      = 1
    eu-central-1   = 1
    eu-west-1      = 1
    eu-west-2      = 0
    ap-south-1     = 1
    ap-northeast-1 = 0
    ap-northeast-2 = 1
    ap-southeast-1 = 0
    ap-southeast-2 = 1
    ca-central-1   = 0
    sa-east-1      = 0
  }
# 13 Makers across 8 Regions
  maker_node_counts     = {
    us-east-1      = 2
    us-east-2      = 1
    us-west-1      = 0
    us-west-2      = 2
    eu-central-1   = 1
    eu-west-1      = 2
    eu-west-2      = 0
    ap-south-1     = 1
    ap-northeast-1 = 0
    ap-northeast-2 = 2
    ap-southeast-1 = 0
    ap-southeast-2 = 2
    ca-central-1   = 0
    sa-east-1      = 0
  }
# 7 Validators across 7 Regions
  validator_node_counts = {
    us-east-1      = 1
    us-east-2      = 1
    us-west-1      = 0
    us-west-2      = 1
    eu-central-1   = 0
    eu-west-1      = 1
    eu-west-2      = 0
    ap-south-1     = 1
    ap-northeast-1 = 0
    ap-northeast-2 = 1
    ap-southeast-1 = 0
    ap-southeast-2 = 1
    ca-central-1   = 0
    sa-east-1      = 0
  }
# 1 Observer across 1 Region
  observer_node_counts  = {
    us-east-1      = 1
    us-east-2      = 0
    us-west-1      = 0
    us-west-2      = 0
    eu-central-1   = 0
    eu-west-1      = 0
    eu-west-2      = 0
    ap-south-1     = 0
    ap-northeast-1 = 0
    ap-northeast-2 = 0
    ap-southeast-1 = 0
    ap-southeast-2 = 0
    ca-central-1   = 0
    sa-east-1      = 0
  }
}
