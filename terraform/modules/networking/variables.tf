variable "project_id" {
  description = "The ID of the GCP project where resources will be created"
  type        = string
}

variable "region" {
  description = "The region where resources will be created"
  type        = string
  default     = "us-central1" # Default for cost optimization
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "default-vpc"
}

variable "subnets" {
  description = "A map of subnets with name, region, and CIDR blocks"
  type = map(object({
    cidr_block = string
    region     = string
  }))
  default = {
    subnet1 = {
      cidr_block = "10.0.0.0/28" # Minimal CIDR block for small subnets
      region     = "us-central1"
    }
  }
}

variable "firewall_rules" {
  description = "Firewall rules to allow traffic (minimal configuration)"
  type = list(object({
    name          = string
    direction     = string
    priority      = number
    ranges        = list(string)
    allow_ports   = list(object({
      protocol = string
      ports    = list(string)
    }))
  }))
  default = [
    {
      name       = "allow-internal"
      direction  = "INGRESS"
      priority   = 1000
      ranges     = ["10.0.0.0/28"]
      allow_ports = [
        {
          protocol = "tcp"
          ports    = ["22", "80"]
        }
      ]
    }
  ]
}

