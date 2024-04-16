<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.4 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.94.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.94.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_mssql_database.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.94.0/docs/resources/mssql_database) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.94.0/docs/data-sources/client_config) | data source |
| [azurerm_resource_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.94.0/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_databases"></a> [databases](#input\_databases) | Map of objects to configure MSSQL Database | <pre>map(object({<br>    collation                   = optional(string, "SQL_Latin1_General_CP1_CI_AS")<br>    sku                         = optional(string, "GP_S_Gen5_1")<br>    max_size_gb                 = optional(string, "20")<br>    min_capacity                = optional(string, "0.5")<br>    auto_pause_delay_in_minutes = optional(number, 60)<br>    create_mode                 = optional(string, "Default")<br>    creation_source_database_id = optional(string, null)<br>    storage_account_type        = optional(string, "ZRS")<br>  }))</pre> | `{}` | no |
| <a name="input_default_retention_days"></a> [default\_retention\_days](#input\_default\_retention\_days) | Point In Time Restore configuration. Value has to be between 1 and 35. | `number` | `3` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | A mapping of tags to assign to the resource. | `map(any)` | <pre>{<br>  "ManagedByTerraform": "True"<br>}</pre> | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | `"West Europe"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Azure MSSQL and database component. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_server_id"></a> [server\_id](#input\_server\_id) | The id of the MS SQL Server on which to create the database. Changing this forces a new resource to be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sql_database_id"></a> [sql\_database\_id](#output\_sql\_database\_id) | The ID of the MS SQL Database. |
| <a name="output_sql_database_max_size"></a> [sql\_database\_max\_size](#output\_sql\_database\_max\_size) | The max size of the database in gigabytes. |
| <a name="output_sql_database_names"></a> [sql\_database\_names](#output\_sql\_database\_names) | The name of the MS SQL Database. |
| <a name="output_sql_server_id"></a> [sql\_server\_id](#output\_sql\_server\_id) | The ID of the MS SQL server |
| <a name="output_storage_account_type"></a> [storage\_account\_type](#output\_storage\_account\_type) | Storage account type used to store backups for this database |
<!-- END_TF_DOCS -->