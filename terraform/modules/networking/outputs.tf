output "vpc_name" {
  description = "The name of the created VPC"
  value       = google_compute_network.vpc.name
}

output "subnets" {
  description = "Details of created subnets"
  value = {
    for name, subnet in google_compute_subnetwork.subnets :
    name => {
      name       = subnet.name
      region     = subnet.region
      cidr_block = subnet.ip_cidr_range
    }
  }
}

output "firewall_rules" {
  description = "Details of created firewall rules"
  value = {
    for name, rule in google_compute_firewall.firewall_rules :
    name => {
      name          = rule.name
      direction     = rule.direction
      priority      = rule.priority
      source_ranges = rule.source_ranges
    }
  }
}
