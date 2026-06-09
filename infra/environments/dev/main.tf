module "vpc" {
  source = "../../modules/vpc"

  project_name        = "microservices-project"
  environment         = "dev"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
  availability_zone   = "eu-west-1a"
}

module "security" {
  source = "../../modules/security"

  vpc_id       = module.vpc.vpc_id
  project_name = "microservices-project"
  environment  = "dev"
}

module "ec2" {
  source = "../../modules/ec2"

  project_name      = "microservices-project"
  environment       = "dev"
  ami_id            = "ami-0daff188b5216c5f0"
  instance_type     = "t3.small"
  subnet_id         = module.vpc.public_subnet_id
  security_group_id = module.security.security_group_id
  key_name          = "microservices-project-dev-key-v2"
}