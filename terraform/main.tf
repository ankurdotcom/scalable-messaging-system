# Include modules for reusable resources
module "networking" {
  source     = "./modules/networking"
  project_id = "your-gcp-project-id"
  region     = "us-central1"

  vpc_name = "production-vpc"

  subnets = {
    subnet1 = {
      cidr_block = "10.0.1.0/28"
      region     = "us-central1"
    }
    subnet2 = {
      cidr_block = "10.0.2.0/28"
      region     = "us-east1"
    }
  }

  firewall_rules = [
    {
      name       = "allow-internal"
      direction  = "INGRESS"
      priority   = 1000
      ranges     = ["10.0.0.0/28"]
      allow_ports = [
        { protocol = "tcp", ports = ["22", "80"] }
      ]
    }
  ]
}

module "compute" {
  source = "./modules/compute"
  target_size             = 3
  health_check_id         = google_compute_health_check.default.id
  region                  = "us-central1"
  instance_group_name     = "my-instance-group"
  instance_base_name      = "my-instance"
  source_image            = "projects/debian-cloud/global/images/family/debian-11"
  network                 = "default"
  instance_template_prefix = "my-template"
  machine_type            = "n1-standard-1"
}

module "pubsub" {
  source = "./modules/pubsub"

  topics = {
    topic1 = {
      name              = "iot-data-stream"
      subscription_name = "iot-data-subscription"
    }
    topic2 = {
      name              = "health-tech-alerts"
      subscription_name = "health-alerts-subscription"
    }
    topic3 = {
      name              = "ai-ml-pipeline"
      subscription_name = "ai-ml-subscription"
    }
  }
}

resource "google_compute_health_check" "default" {
  name = "default-health-check"

  http_health_check {
    port = 80
  }

  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 2
}



