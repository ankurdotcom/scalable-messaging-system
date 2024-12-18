output "network_info" {
  description = "Information about the network setup"
  value       = module.networking.network_info
}

output "compute_instances" {
  description = "Details of the compute instances"
  value       = module.compute.instances
}

output "pubsub_topic" {
  description = "The name of the created Pub/Sub topic"
  value       = module.pubsub.topic_name
}
