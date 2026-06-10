# Limitations and Future Improvements

## Current Limitations

### Database

Services currently use H2.

Limitations:

- In-memory storage
- Data loss after restart

Future:
- PostgreSQL on Amazon RDS
- Automated backups
- Persistent storage

---

### Container Orchestration

Containers are deployed using Docker Compose.

Future:

- Amazon ECS
- Kubernetes

---

### Monitoring

Current monitoring uses Spring Boot Actuator.

Future:

- CloudWatch
- Prometheus
- Grafana

---

### Logging

Logs are stored locally.

Future:

- Centralized logging
- ELK Stack

---

### Messaging

Current implementation uses Amazon SQS with a Dead Letter Queue (DLQ).

Implemented:

- Main queue
- Dead Letter Queue
- Retry handling through SQS redrive policy

Future:

- Event versioning
- Multiple queues
- Event schema registry

### Scalability

Current deployment uses a single EC2 instance.

Future:

- Auto Scaling Groups
- Load Balancer
- Multi-AZ deployment

---

## Lessons Learned

The project demonstrated:

- Infrastructure as Code
- Cloud deployment
- Event-driven architecture
- CI/CD automation
- AWS IAM and OIDC integration
- Microservices communication