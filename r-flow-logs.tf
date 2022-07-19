resource "azurerm_network_watcher_flow_log" "nsg_flow_logs" {
  count = var.enable_nsg_watcher_flow_log ? 1 : 0

  name = "flowlogs-${azurerm_network_security_group.nsg.name}"

  network_watcher_name      = var.network_watcher_name
  network_security_group_id = azurerm_network_security_group.nsg.id
  resource_group_name       = var.network_watcher_resource_group_name
  location                  = var.flow_log_location

  storage_account_id = var.logs_storage_account_id
  enabled            = var.flow_log_disabled

  version = var.flow_log_version

  retention_policy {
    enabled = true
    days    = 90
  }

  traffic_analytics {
    enabled               = true
    workspace_id          = var.log_analytics_workspace_guid
    workspace_region      = var.log_analytics_workspace_location
    workspace_resource_id = var.log_analytics_workspace_id
    interval_in_minutes   = var.traffic_analytics_interval_in_minutes
  }
}
