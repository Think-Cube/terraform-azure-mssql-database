###########################
# Common vars
###########################
variable "default_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
  default = {
    "ManagedByTerraform" = "True"
  }
}
###########################
# Resource groups vars
###########################
variable "resource_group_location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  default     = "West Europe"
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the Azure MSSQL and database component. Changing this forces a new resource to be created."
  type        = string
}
###########################
# MSSQL database groups vars
###########################
variable "databases" {
  type = map(object({
    collation                   = optional(string, "SQL_Latin1_General_CP1_CI_AS")
    sku                         = optional(string, "GP_S_Gen5_1")
    max_size_gb                 = optional(string, "20")
    min_capacity                = optional(string, "0.5")
    auto_pause_delay_in_minutes = optional(number, 60)
    create_mode                 = optional(string, "Default")
    creation_source_database_id = optional(string, null)
    storage_account_type        = optional(string, "ZRS")
  }))
  description = "Map of objects to configure MSSQL Database"
  default     = {}
}
variable "default_retention_days" {
  type        = number
  description = "Point In Time Restore configuration. Value has to be between 1 and 35."
  default     = 3
}
variable "server_id" {
  type        = string
  description = "The id of the MS SQL Server on which to create the database. Changing this forces a new resource to be created."
}