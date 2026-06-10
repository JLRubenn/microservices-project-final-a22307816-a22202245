# System Architecture Diagram

```mermaid
flowchart TB

    Client[Client]

    Client --> Gateway[API Gateway]

    Gateway --> UserService[User Service]
    Gateway --> ProductService[Product Service]
    Gateway --> OrderService[Order Service]

    OrderService --> UserService
    OrderService --> ProductService

    ProductService --> SQS[AWS SQS Queue]
    SQS --> OrderService
    SQS --> DLQ[Dead Letter Queue]

    OrderService --> Kafka[(Kafka)]
    Kafka --> ProductService

    subgraph AWS
        EC2[EC2 Instance]
        SQS
    end

    UserService --> EC2
    ProductService --> EC2
    OrderService --> EC2
    Gateway --> EC2
```
## Event Reliability

Amazon SQS is configured with a Dead Letter Queue (DLQ).

Messages that fail processing three times are automatically moved to the DLQ for later inspection and troubleshooting.