resource_group_name   = "zs-oyorooms-redis"
location              = "centralindia"

pvt_dns_zone_name = "staging-oyorooms.redis.database.azure.com"
pvt_rg_name       = "network"

# MEMORY MANAGEMENT
# Azure Cache for Redis instances are configured with the following default Redis configuration values:
patch_schedule = null
enable_private_endpoint = true
subnet_name             = "zs-oyo-memorystore"
vnet_name               = "zs-oyorooms"
vnet_rg_name            = "network"
storage_account_name    = "zsoyoroomstf"
stg_rg_name             = "zs-oyorooms-tf"
logs = [{
  enabled        = true
  name           = "allLogs"
  retention_days = 7
}]
