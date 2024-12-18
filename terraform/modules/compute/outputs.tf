output "instances" {
  description = "List of managed instances"
  value       = google_compute_instance_group_manager.group_manager.instance_group
}
