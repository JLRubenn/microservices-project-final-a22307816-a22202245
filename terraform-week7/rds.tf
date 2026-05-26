# rds.tf
resource "aws_db_subnet_group" "main" {
  name       = "week7-db-subnet-group"
  subnet_ids = [aws_subnet.private_1a.id, aws_subnet.private_1b.id]

  tags = {
    Name = "week7-db-subnet-group"
  }
}

resource "aws_security_group" "rds" {
  name        = "week7-rds-sg"
  description = "Security group for RDS"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.web_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "week7-rds-sg"
  }
}

resource "aws_db_instance" "main" {
  identifier              = "week7-database"
  engine                  = "postgres"
  engine_version          = "17"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  storage_type            = "gp3"
  db_name                 = "week7db"
  username                = "admin"
  password                = var.db_password
  vpc_security_group_ids  = [aws_security_group.rds.id]
  db_subnet_group_name    = aws_db_subnet_group.main.name
  backup_retention_period = 0
  skip_final_snapshot     = true
  storage_encrypted       = true
  publicly_accessible     = false

  tags = {
    Name = "week7-database"
  }
}