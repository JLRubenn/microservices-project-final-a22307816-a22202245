# Limitations and Future Improvements

## Current Limitations

### Database

Services use PostgreSQL containers with persistent Docker volumes.

Current setup:
- user-service → PostgreSQL (userdb)
- product-service → PostgreSQL (productdb)
- order-service → PostgreSQL (orderdb)

Persistence is maintained after service restarts through Docker volumes.

Future improvements:
- PostgreSQL on Amazon RDS
- Automated backups
- Multi-AZ database deployment
- Monitoring and alerting

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