terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker" 
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Image PostgreSQL
resource "docker_image" "postgres" {
  name = "postgres:latest"
}

# Conteneur PostgreSQL
resource "docker_container" "postgres" {
  name  = "postgres-db"
  image = docker_image.postgres.image_id
  
  ports {
    internal = 5432
    external = var.postgres_port
  }
  
  env = [
    "POSTGRES_USER=${var.postgres_user}",
    "POSTGRES_PASSWORD=${var.postgres_password}",
    "POSTGRES_DB=${var.postgres_db}"
  ]
}

# Image Application Web
resource "docker_image" "webapp" {
  name = "webapp:latest"
  build {
    context    = "."
    dockerfile = "Dockerfile"
  }
}

# Conteneur Application Web
resource "docker_container" "webapp" {
  name  = "webapp"
  image = docker_image.webapp.image_id
  
  ports {
    internal = 80
    external = var.app_port
  }
}
