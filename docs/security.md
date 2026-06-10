# Security Decisions

## Authentication

GitHub Actions authenticates with AWS using OIDC.

Benefits:

- No AWS access keys stored in GitHub
- Short-lived credentials
- Improved security

---

## IAM Roles

The EC2 instance uses an IAM Role attached through an Instance Profile.

Permissions include:

- SQS SendMessage
- SQS ReceiveMessage
- SQS DeleteMessage
- SQS GetQueueAttributes
- SQS GetQueueUrl

---

## Secrets Management

GitHub Secrets are used for:

- DOCKERHUB_USERNAME
- DOCKERHUB_TOKEN
- AWS_ROLE_TO_ASSUME

No credentials are stored in source code.

---

## Network Security

Security Groups restrict access.

Allowed:

- HTTP
- HTTPS
- SSH

All other traffic is denied by default.

---

## Principle of Least Privilege

Permissions were limited to the minimum required resources.

Examples:

- EC2 role can access only the project SQS queue.
- GitHub OIDC role can access only required Terraform resources.

---

## Container Security

Services run inside isolated Docker containers.

Benefits:

- Process isolation
- Environment isolation
- Reproducible deployments

---

## Message Reliability

Amazon SQS is configured with a Dead Letter Queue (DLQ).

Messages that repeatedly fail processing are automatically redirected to the DLQ after three receive attempts. This prevents message loss and improves fault tolerance.