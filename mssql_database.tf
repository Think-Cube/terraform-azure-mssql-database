resource "azurerm_mssql_database" "main" {
  for_each = var.databases

  name                        = each.key
  server_id                   = var.server_id
  collation                   = each.value.collation
  sku_name                    = each.value.sku
  max_size_gb                 = each.value.max_size_gb
  min_capacity                = each.value.min_capacity
  auto_pause_delay_in_minutes = each.value.auto_pause_delay_in_minutes
  create_mode                 = each.value.create_mode
  creation_source_database_id = each.value.creation_source_database_id
  storage_account_type        = each.value.storage_account_type == "ZRS" ? "Zone" : "Geo"
  tags                        = var.default_tags

  short_term_retention_policy {
    retention_days = lookup(each.value, "retention_days", var.default_retention_days)
  }

  lifecycle {
    ignore_changes = [
      sku_name,
    ]
  }
}