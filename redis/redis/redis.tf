module "redis" {
  source = "../../module/redis"

  create_resource_group = false
  resource_group_name   = "acpmm"
  location              = var.location
  pvt_dns_zone_name     = var.pvt_dns_zone_name
  pvt_rg_name           = var.pvt_rg_name
  pe_resource_name      = "tfs-rg-hub-eu-speech"
  pse_resource_name     = "tfs-rg-hub-eu-speech"
  redis_instance_name   = "tfs-rg-hub-eu-speech"
  redis_server_settings = {
    name                          = "tfs-rg-hub-eu-speech"
    sku_name                      = "Basic"
    redis_version                 = 6
    capacity                      = 1
    family                        = "C"
    enable_non_ssl_port           = true
    public_network_access_enabled = false
  }

  redis_configuration = {
    maxmemory_policy = "volatile-lru"
  }

  patch_schedule          = var.patch_schedule
  firewall_rules          = null
  enable_private_endpoint = true
  subnet_name             = var.subnet_name
  vnet_name               = var.vnet_name
  vnet_rg_name            = var.vnet_rg_name
  storage_account_name    = "tfs-storage"
  stg_rg_name             = "tfs-rg-strg-eu-speech"
  tags = {
    "App"       = "redis"
    "Name"      = "tfs-rg-hub-eu-speechb"
    "Env"       = "hub"
    "Team"      = "speech"
    "Service"   = "speech"
    "Terraform" = "1"
  }
  storage_account_id = data.azurerm_storage_account.diagnostic.id
  logs               = var.logs
  metrics            = var.metrics
}
