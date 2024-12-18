# Create VPC
resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  project                 = var.project_id
}

# Create Subnets
resource "google_compute_subnetwork" "subnets" {
  for_each = var.subnets
  name          = each.key
  ip_cidr_range = each.value.cidr_block
  region        = each.value.region
  network       = google_compute_network.vpc.id
  project       = var.project_id
}

# Create Firewall Rules
resource "google_compute_firewall" "firewall_rules" {
  for_each  = { for rule in var.firewall_rules : rule.name => rule }
  name      = each.value.name
  direction = each.value.direction
  priority  = each.value.priority
  network   = google_compute_network.vpc.self_link
  project   = var.project_id

  source_ranges = each.value.ranges

  dynamic "allow" {
    for_each = each.value.allow_ports
    content {
      protocol = allow.value.protocol
      ports    = allow.value.ports
    }
  }
}

