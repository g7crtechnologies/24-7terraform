resource_group_name   = ""
location              = "eastus"
virtual_network_name  = ""
subnet_name           = "gateway"
public_ip_sku         = "Standard"
pip_allocation_method = "Static"
authorization_name    = "hub-auth"
er_config = {
  bandwidth_in_mbps        = 50
  name                     = "hub"
  peering_location         = "Silicon Valley"
  service_provider_name    = "AT&T Netbond"
  allow_classic_operations = false
}
vng_config = {
  name          = "vpn_gateway"
  sku           = "HighPerformance"
  type          = "ExpressRoute"
  active_active = false
}
con_config = {
  authorization_key = "XJbFYyIQQD56H8mgAtl"
  name              = "connections_gw"
  type              = "ExpressRoute"
}
sku = {
  family = "MeteredData"
  tier   = "Standard"
}
