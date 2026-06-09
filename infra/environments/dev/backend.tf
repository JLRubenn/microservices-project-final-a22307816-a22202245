terraform {
  backend "s3" {
    bucket         = "microservices-project-tf-state-ruben"
    key            = "dev/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "microservices-project-tf-locks"
    encrypt        = true
  }
}