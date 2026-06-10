# Deployment Workflow

## Infrastructure Deployment

Terraform provisions AWS infrastructure.

Navigate to:

```bash
cd infra/environments/dev
```

Initialize:

```bash
terraform init
```

Validate:

```bash
terraform validate
```

Plan:

```bash
terraform plan
```

Apply:

```bash
terraform apply
```

---

## Docker Image Build

GitHub Actions automatically builds Docker images.

Workflow:

```text
.github/workflows/matrix-image.yml
```

Images are pushed to DockerHub.

---

## EC2 Configuration

Ansible configures the EC2 instance.

Tasks:

- Install Docker
- Install Docker Compose
- Pull Docker images
- Start containers

Run:

```bash
ansible-playbook playbook.yml
```

---

## CI/CD Pipeline

### Pull Request

CI workflow executes:

- Maven validate
- Maven compile
- Unit tests
- JaCoCo coverage

Workflow:

```text
.github/workflows/ci.yml
```

### Main Branch

Image workflow executes:

- Docker build
- Docker push

Workflow:

```text
.github/workflows/matrix-image.yml
```

### Terraform

Workflow:

```text
.github/workflows/terraform.yml
```

Performs:

- Terraform init
- Terraform validate
- Terraform plan
- Terraform apply

Infrastructure created by Terraform:

- VPC
- Subnets
- Route Tables
- Security Groups
- EC2 Instance
- IAM Roles
- Amazon SQS Queue
- Amazon SQS Dead Letter Queue

### OIDC Validation

Workflow:

```text
.github/workflows/aws-test.yml
```

Validates AWS role assumption using GitHub OIDC.

---

## Production Deployment Flow

1. Developer pushes code
2. CI workflow executes
3. Docker images are built
4. Images are pushed to DockerHub
5. Terraform provisions infrastructure
6. Ansible configures EC2
7. Docker Compose starts containers
8. Services become available