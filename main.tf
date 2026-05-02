terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version= "~> 5.0"
    }
  }
}

provider "aws" {
  access_key                  = "test"
  secret_key                  = "test"
  region                      = "us-east-1"

  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    s3 = "http://localhost:4566"
  }
}

resource "aws_s3_bucket" "bucket_prueba" {
  bucket = "mi-bucket-terraform-localstack"
# Modificación: Añadimos etiqueta al primer bucket s3
tags= {
 Environment = "Dev"
 Project = "LocalStack-Test"
  }
}

resource "aws_s3_bucket" "bucket_prueba_2" {
  bucket = "mi-bucket-terraform-prueba-2-localstack"
}

module "mi_instancia_de_recurso" {
  source            = "./modules/mi-recurso"
  nombre_del_bucket = "mi-bucket-creado-con-modulos"
}
