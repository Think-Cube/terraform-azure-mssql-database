provider "azurerm" {
features {}
}

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
