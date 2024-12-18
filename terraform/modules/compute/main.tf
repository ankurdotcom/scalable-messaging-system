resource "google_compute_instance_template" "template" {
  name_prefix = var.instance_template_prefix
  machine_type = var.machine_type
  region       = var.region

  tags = ["http-server"]

  disk {
    auto_delete  = true
    boot         = true
    source_image = var.source_image
  }

  network_interface {
    network = var.network
    access_config {}
  }
}

resource "google_compute_instance_group_manager" "group_manager" {
  name                = var.instance_group_name
  base_instance_name  = var.instance_base_name
  region              = var.region
  instance_template   = google_compute_instance_template.template.id
  target_size         = var.target_size

  auto_healing_policies {
    health_check      = var.health_check_id
    initial_delay_sec = 300
  }
}
