# Setup Guide

## Requirements

### Local

- Java 21
- Maven 3.9+
- Docker
- Docker Compose
- Git

### AWS

- AWS Account
- IAM User
- Terraform
- GitHub Account
- DockerHub Account

---

## Clone Repository

```bash
git clone <repository-url>
cd microservices-project
```

---

## Build Services

```bash
mvn clean package
```

---

## Start Kafka

```bash
docker compose -f docker-compose.kafka.yml up -d
```

---

## Start Application

```bash
docker compose up -d
```

---

## Verify Containers

```bash
docker ps
```

---

## Access Services

API Gateway:

```text
http://localhost:8080
```

User Service:

```text
http://localhost:8081
```

Product Service:

```text
http://localhost:8082
```

Order Service:

```text
http://localhost:8083
```