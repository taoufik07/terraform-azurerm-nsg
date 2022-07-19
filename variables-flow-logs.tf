variable "enable_nsg_watcher_flow_log" {
  description = "Should the flow log resource be provisioned (Not to be confused with `flow_log_disabled`)"
}

variable "flow_log_disabled" {
  description = "Should Network Flow Logging be Enabled?"
  type        = boolean
  default     = false
}

variable "flow_log_version" {
  description = "Version of the flow log. Possible values `1` and `2`."
  type        = number
  default     = 2
}

variable "flow_log_location" {
  description = "The location where the Network Watcher Flow Log resides. Changing this forces a new resource to be created. Defaults to the location of the Network Watcher."
  type        = string
  default     = null
}

variable "network_watcher_name" {
  description = "Network watcher name"
  type        = string
}

variable "network_watcher_resource_group_name" {
  description = "Network watcher name"
  type        = string
}

variable "logs_storage_account_id" {
  description = "Logs storage account id"
  type        = string
}

variable "retention_policy" {
  description = "https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_watcher_flow_log#retention_policy"
  type = map({
    enabled : boolean
    days : number
  })
}

variable "traffic_analytics" {
  description = "https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_watcher_flow_log#traffic_analytics"
  type = map({
    enabled               = boolean
    workspace_id          = string # Log analytics workspace guid
    workspace_region      = string
    workspace_resource_id = string
    interval_in_minutes   = number
  })
}
