variable "region" {
  description = "Region for the resources"
  type        = string
}

variable "target_size" {
  description = "The target size of the instance group"
  type        = number
}

variable "health_check_id" {
  description = "Health check ID used for auto healing"
  type        = string
}

variable "instance_group_name" {
  description = "The name of the instance group"
  type        = string
}

variable "instance_base_name" {
  description = "The base name for the instance"
  type        = string
}

variable "source_image" {
  description = "Source image for the instance"
  type        = string
}

variable "network" {
  description = "The network to use"
  type        = string
}

variable "instance_template_prefix" {
  description = "The prefix for the instance template"
  type        = string
}

variable "machine_type" {
  description = "Machine type for the instance"
  type        = string
}
