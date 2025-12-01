output "webapp_url" {
  value = "http://localhost:${var.app_port}"
}

output "postgres_connection" {
  value = "postgresql://${var.postgres_user}:${var.postgres_password}@localhost:${var.postgres_port}/${var.postgres_db}"
}
