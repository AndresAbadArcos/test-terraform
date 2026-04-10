# Configuración de AWS Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configuración de la región de AWS
provider "aws" {
  region     = "eu-west-1"
  access_key = var.access_key
  secret_key = var.secret_key
}


