project_id             = "scalable-messaging-system"
region                 = "us-central1"
vpc_name               = "messaging-vpc"
subnet_name            = "messaging-subnet"
subnet_cidr            = "10.0.0.0/24"
instance_template_prefix = "msg-sys-template"
instance_group_name    = "msg-instance-group"
instance_base_name     = "msg-instance"
machine_type           = "e2-micro"
source_image           = "debian-cloud/debian-11"
network                = "projects/your-gcp-project-id/global/networks/messaging-vpc"
target_size            = 2
health_check_id        = "health-check-id"
#topic_name             = "message-topic"
#subscription_name      = "message-subscription"
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
