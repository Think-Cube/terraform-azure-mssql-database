# Terraform Module: Azure MSSQL Database

This Terraform module creates one or more MSSQL databases on an existing Azure SQL server.

## Example Usage

```hcl
data "azurerm_mssql_server" "main" {
  name                = "dev-63963882ddd-eus-sql"
  resource_group_name = "dev-test-weu-rg"
}

module "mssql_database" {
  source                  = "Think-Cube/mssql-database/azure"
  version                 = "1.0.0"
  resource_group_name     = "dev-test-weu-rg"
  environment             = "dev" 
  region                  = "weu"
  resource_group_location = "West Europe"
  server_id = data.azurerm_mssql_server.main.id
  databases = {
    database1 = {
        server_id                   = coalesce(var.server_id, data.azurerm_mssql_server.main.id) 
        collation                   = "SQL_Latin1_General_CP1_CI_AS"
        sku                         = "GP_S_Gen5_1"
        max_size_gb                 = "20"
        min_capacity                = "0.5"
        auto_pause_delay_in_minutes = 60
        create_mode                 = "Default"
        creation_source_database_id = null
        storage_account_type        = "ZRS"
    }
  }
  default_tags = {
      Administrator     = "John Doe"
      Department        = "IT"
      CostCentre        = "CC123"
      ContactPerson     = "Jane Smith"
      ManagedByTerraform = "True"
}
depends_on = [ data.azurerm_mssql_server.main ]
}
```

### Inputs

* `resource_group_name`: The name of the resource group in which to create the resources.
* `server_id`: The id of the MS SQL Server on which to create the database.
* `databases`: Map of objects to configure MSSQL databases.
* `default_retention_days`: Point In Time Restore configuration.
* `default_tags`: A mapping of tags to assign to the resource.

### Outputs

* `sql_database_id`: The ID of the MS SQL Database.
* `sql_server_id`: The ID of the MS SQL server.
* `sql_database_names`: The name of the MS SQL Databases.
* `sql_database_max_size`: The max size of the databases in gigabytes.
* `storage_account_type`: Storage account type used to store backups.

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).

## Contribution

Feel free to contribute by opening issues or pull requests. Your feedback and improvements are highly appreciated!
