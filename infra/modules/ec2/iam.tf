resource "aws_iam_role" "ec2_sqs_role" {
  name = "${var.project_name}-${var.environment}-ec2-sqs-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "ec2_sqs_policy" {
  name = "${var.project_name}-${var.environment}-ec2-sqs-policy"
  role = aws_iam_role.ec2_sqs_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "sqs:GetQueueUrl",
          "sqs:GetQueueAttributes",
          "sqs:SendMessage",
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
          "sqs:ChangeMessageVisibility"
        ]
        Resource = "arn:aws:sqs:eu-west-1:235063678110:microservices-project-dev-order-events"
      }
    ]
  })
}

resource "aws_iam_instance_profile" "ec2_sqs_profile" {
  name = "${var.project_name}-${var.environment}-ec2-sqs-profile"
  role = aws_iam_role.ec2_sqs_role.name
}