output "quorum_1_maker_node_dns" {
  value = "${module.quorum_cluster.quorum_maker_node_dns}"
}

output "quorum_1_validator_node_dns" {
  value = "${module.quorum_cluster.quorum_validator_node_dns}"
}

output "quorum_1_observer_node_dns" {
  value = "${module.quorum_cluster.quorum_observer_node_dns}"
}

output "bootnode_1_dns" {
  value = "${module.quorum_cluster.bootnode_dns}"
}

output "vault_1_server_ips" {
  value = "${module.quorum_cluster.vault_server_ips}"
}
