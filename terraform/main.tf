# Include modules for reusable resources
module "networking" {
  source = "./modules/networking"
}

module "compute" {
  source = "./modules/compute"
}

module "pubsub" {
  source = "./modules/pubsub"
}

# Outputs for debugging or cross-module reference
output "network_info" {
  value = module.networking.network_info
}

output "compute_instances" {
  value = module.compute.instances
}

output "pubsub_topic" {
  value = module.pubsub.topic_name
}
