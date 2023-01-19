locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.infra.*.name, azurerm_resource_group.infra.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.infra.*.location, azurerm_resource_group.infra.*.location, [""]), 0)
}

data "azurerm_resource_group" "infra" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_resource_group" "infra" {
  count    = var.create_resource_group ? 1 : 0
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

# data "azurerm_log_analytics_workspace" "logws" {
#   count               = var.log_analytics_workspace_name != null ? 1 : 0
#   name                = var.log_analytics_workspace_name
#   resource_group_name = local.resource_group_name
#   depends_on = [
#     azurerm_resource_group.example
#   ]
# }

#---------------------------------------------------------------
# Storage Account to keep logs and backups - Default is "false"
#----------------------------------------------------------------

data "azurerm_storage_account" "stg" {
  name                = var.storage_account_name
  resource_group_name = var.stg_rg_name
}

#------------------------------------------------------------
# Redis Cache Instance configuration - Default (required). 
#------------------------------------------------------------

resource "azurerm_redis_cache" "main" {
  name                          = var.redis_server_settings.name
  resource_group_name           = local.resource_group_name
  location                      = var.location
  capacity                      = var.redis_server_settings.capacity
  family                        = var.redis_server_settings.family
  redis_version                 = var.redis_server_settings.redis_version
  sku_name                      = var.redis_server_settings.sku_name
  enable_non_ssl_port           = var.redis_server_settings.enable_non_ssl_port
  minimum_tls_version           = var.redis_server_settings.minimum_tls_version
  public_network_access_enabled = var.redis_server_settings.public_network_access_enabled
  replicas_per_master           = var.redis_server_settings.sku_name == "Premium" ? var.redis_server_settings.replicas_per_master : null
  shard_count                   = var.redis_server_settings.sku_name == "Premium" ? var.redis_server_settings.shard_count : null
  subnet_id                     = var.redis_server_settings.sku_name == "Premium" ? data.azurerm_subnet.infra.id : null
  zones                         = var.redis_server_settings.sku_name == "Premium" ? var.redis_server_settings.zones : null
  tags                          = var.tags

  redis_configuration {
    #  aof_backup_enabled              = var.enable_aof_backup
    #  aof_storage_connection_string_0 = var.enable_aof_backup == true ? azurerm_storage_account.storeacc.0.primary_blob_connection_string : null
    #  aof_storage_connection_string_1 = var.enable_aof_backup == true ? azurerm_storage_account.storeacc.0.secondary_blob_connection_string : null
    enable_authentication           = lookup(var.redis_configuration, "enable_authentication", true)
    maxfragmentationmemory_reserved = var.redis_server_settings.sku_name == "Premium" || var.redis_server_settings.sku_name == "Standard" ? lookup(var.redis_configuration, "maxfragmentationmemory_reserved") : null
    maxmemory_delta                 = var.redis_server_settings.sku_name == "Premium" || var.redis_server_settings.sku_name == "Standard" ? lookup(var.redis_configuration, "maxmemory_delta") : null
    maxmemory_policy                = lookup(var.redis_configuration, "maxmemory_policy")
    maxmemory_reserved              = var.redis_server_settings.sku_name == "Premium" || var.redis_server_settings.sku_name == "Standard" ? lookup(var.redis_configuration, "maxmemory_reserved") : null
    notify_keyspace_events          = lookup(var.redis_configuration, "notify_keyspace_events")
    rdb_backup_enabled              = var.redis_server_settings.sku_name == "Premium" && var.enable_data_persistence == true ? true : false
    rdb_backup_frequency            = var.redis_server_settings.sku_name == "Premium" && var.enable_data_persistence == true ? var.data_persistence_backup_frequency : null
    rdb_backup_max_snapshot_count   = var.redis_server_settings.sku_name == "Premium" && var.enable_data_persistence == true ? var.data_persistence_backup_max_snapshot_count : null
    rdb_storage_connection_string   = var.redis_server_settings.sku_name == "Premium" && var.enable_data_persistence == true ? data.azurerm_storage_account.stg.primary_blob_connection_string : null
  }

  dynamic "patch_schedule" {
    for_each = var.patch_schedule != null ? [var.patch_schedule] : []
    content {
      day_of_week    = var.patch_schedule.day_of_week
      start_hour_utc = var.patch_schedule.start_hour_utc
    }
  }

  lifecycle {
    # A bug in the Redis API where the original storage connection string isn't being returneds
    ignore_changes = [redis_configuration.0.rdb_storage_connection_string]
  }
}

#----------------------------------------------------------------------
# Adding Firewall rules for Redis Cache Instance - Default is "false"
#----------------------------------------------------------------------
resource "azurerm_redis_firewall_rule" "name" {
  for_each            = var.firewall_rules != null ? { for k, v in var.firewall_rules : k => v if v != null } : {}
  name                = format("%s", each.key)
  redis_cache_name    = azurerm_redis_cache.main.name
  resource_group_name = local.resource_group_name
  start_ip            = each.value["start_ip"]
  end_ip              = each.value["end_ip"]
}


#---------------------------------------------------------
# Private Link for Redis Server - Default is "false" 
#---------------------------------------------------------
# data "azurerm_virtual_network" "vnet01" {
#   count               = var.enable_private_endpoint ? 1 : 0
#   name                = var.virtual_network_name
#   resource_group_name = local.resource_group_name
#   depends_on = [azurerm_resource_group.example]
# }

data "azurerm_subnet" "infra" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.vnet_rg_name
}

data "azurerm_private_dns_zone" "infra" {
  name                = var.pvt_dns_zone_name
  resource_group_name = var.pvt_rg_name
}

resource "azurerm_private_endpoint" "infra" {
  count               = var.redis_server_settings.sku_name == "Standard" || var.redis_server_settings.sku_name == "Basic" ? 1 : 0
  name                = var.pe_resource_name
  location            = var.location
  resource_group_name = local.resource_group_name
  subnet_id           = data.azurerm_subnet.infra.id
  tags                = var.tags
  private_dns_zone_group {
    name                 = var.redis_instance_name
    private_dns_zone_ids = [data.azurerm_private_dns_zone.infra.id]
  }

  private_service_connection {
    name                           = var.pse_resource_name
    is_manual_connection           = false
    private_connection_resource_id = azurerm_redis_cache.main.id
    subresource_names              = ["redisCache"]
  }
}

data "azurerm_private_endpoint_connection" "example" {
  count               = var.redis_server_settings.sku_name == "Standard" || var.redis_server_settings.sku_name == "Basic" ? 1 : 0
  name                = var.pe_resource_name
  resource_group_name = local.resource_group_name
  depends_on = [
    data.azurerm_resource_group.infra, azurerm_resource_group.infra, azurerm_redis_cache.main, azurerm_private_endpoint.infra
  ]
}

resource "azurerm_private_dns_a_record" "arecord1" {
  count               = var.redis_server_settings.sku_name == "Standard" || var.redis_server_settings.sku_name == "Basic" ? 1 : 0
  name                = var.redis_instance_name
  zone_name           = data.azurerm_private_dns_zone.infra.name
  resource_group_name = var.pvt_rg_name
  ttl                 = 300
  records             = [data.azurerm_private_endpoint_connection.example.0.private_service_connection.0.private_ip_address]
}

/*
data "azurerm_private_endpoint_connection" "private-ip1" {
  count               = var.enable_private_endpoint ? 1 : 0
  name                = azurerm_private_endpoint.infra[count.index].name
  resource_group_name = local.resource_group_name
  depends_on          = [azurerm_redis_cache.main]
}

data "azurerm_private_dns_zone" "infra" {
  name                = var.pvt_dns_zone_name
  resource_group_name = var.pvt_rg_name
}
*/
# resource "azurerm_private_dns_zone_virtual_network_link" "vent-link1" {
#   count                 = var.existing_private_dns_zone == null && var.enable_private_endpoint ? 1 : 0
#   name                  = "vnet-private-zone-link"
#   resource_group_name   = local.resource_group_name
#   private_dns_zone_name = azurerm_private_dns_zone.dnszone1.0.name
#   virtual_network_id    = data.azurerm_virtual_network.vnet01.0.id
#   tags                  = merge({ "Name" = format("%s", "vnet-private-zone-link") }, var.tags, )
# }
/*
resource "azurerm_private_dns_a_record" "arecord1" {
  count               = var.enable_private_endpoint ? 1 : 0
  name                = var.dns_record
  zone_name           = data.azurerm_private_dns_zone.infra.name
  resource_group_name = local.resource_group_name
  ttl                 = 300
  records             = [data.azurerm_private_endpoint_connection.private-ip1.0.private_service_connection.0.private_ip_address]
}
*/
#------------------------------------------------------------------
# azurerm monitoring diagnostics  - Default is "false" 
#------------------------------------------------------------------
# resource "azurerm_monitor_diagnostic_setting" "extaudit" {
#   count                      = var.log_analytics_workspace_name != null ? 1 : 0
#   name                       = lower("extaudit-${element([for n in azurerm_redis_cache.main : n.name], 0)}-diag")
#   target_resource_id         = element([for i in azurerm_redis_cache.main : i.id], 0)
#   log_analytics_workspace_id = data.azurerm_log_analytics_workspace.logws.0.id
#   storage_account_id         = var.enable_data_persistence ? azurerm_storage_account.storeacc.0.id : null

#   metric {
#     category = "AllMetrics"

#     retention_policy {
#       enabled = false
#     }
#   }

#   lifecycle {
#     ignore_changes = [metric]
#   }
# }
