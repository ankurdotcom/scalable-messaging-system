output "topics" {
  description = "List of created Pub/Sub topics"
  value = {
    for key, topic in google_pubsub_topic.topics :
    key => topic.name
  }
}

output "subscriptions" {
  description = "List of created Pub/Sub subscriptions"
  value = {
    for key, subscription in google_pubsub_subscription.subscriptions :
    key => subscription.name
  }
}
