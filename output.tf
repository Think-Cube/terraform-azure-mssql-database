output "sql_database_id" {
  value       = { for k, v in azurerm_mssql_database.main : k => v.id }
  description = "The ID of the MS SQL Database."
  sensitive   = false
}

output "sql_server_id" {
  value       = { for k, v in azurerm_mssql_database.main : k => v.server_id }
  description = "The ID of the MS SQL server"
  sensitive   = false
}

output "sql_database_names" {
  value       = { for k, v in azurerm_mssql_database.main : k => v.name }
  description = "The name of the MS SQL Database."
  sensitive   = false
}

output "sql_database_max_size" {
  value       = { for k, v in azurerm_mssql_database.main : k => v.max_size_gb }
  description = "The max size of the database in gigabytes."
  sensitive   = false
}

output "storage_account_type" {
  value       = { for k, v in azurerm_mssql_database.main : k => v.storage_account_type }
  description = "Storage account type used to store backups for this database"
  sensitive   = false
}