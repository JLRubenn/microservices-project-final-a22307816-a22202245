resource "aws_sqs_queue" "order_events_dlq" {
  name = "${var.project_name}-${var.environment}-order-events-dlq"

  message_retention_seconds = 1209600

  tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

resource "aws_sqs_queue" "order_events" {
  name = "${var.project_name}-${var.environment}-order-events"

  visibility_timeout_seconds = 30
  message_retention_seconds  = 345600
  receive_wait_time_seconds  = 20

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.order_events_dlq.arn
    maxReceiveCount     = 3
  })

  tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

output "sqs_order_events_queue_url" {
  value = aws_sqs_queue.order_events.url
}

output "sqs_order_events_dlq_url" {
  value = aws_sqs_queue.order_events_dlq.url
}