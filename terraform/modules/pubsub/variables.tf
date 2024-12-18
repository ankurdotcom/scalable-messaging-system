variable "topics" {
  description = "List of topics with their subscription details"
  type = map(object({
    name              = string
    subscription_name = string
  }))
}
