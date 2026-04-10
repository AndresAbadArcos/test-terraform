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
  region = "eu-west-1"
}


