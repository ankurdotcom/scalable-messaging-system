# Project ID for GCP
variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

# Region to deploy resources
variable "region" {
  description = "The GCP region"
  type        = string
  default     = "us-central1"
}

# Pub/Sub topic name
variable "pubsub_topic_name" {
  description = "Name of the Pub/Sub topic"
  type        = string
  default     = "default-topic"
}
