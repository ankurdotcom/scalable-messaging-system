# Create multiple Pub/Sub topics
resource "google_pubsub_topic" "topics" {
  for_each = var.topics
  name     = each.value.name
}

# Create subscriptions for each topic
resource "google_pubsub_subscription" "subscriptions" {
  for_each = var.topics
  name     = each.value.subscription_name
  topic    = google_pubsub_topic.topics[each.key].name
}
