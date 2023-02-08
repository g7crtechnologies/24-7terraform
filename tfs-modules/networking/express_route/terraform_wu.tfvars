#Variable for West US Region
location ="westus"
public_ip_sku         = "Standard"
pip_allocation_method = "Static"
authorization_name    = "hub-auth"
er_config = {
  bandwidth_in_mbps        = 100
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
  name              = "connections-gw"
  type              = "ExpressRoute"
}
sku = {
  family = "MeteredData"
  tier   = "Standard"
}
gateway_subnet = [ "10.86.48.64/26" ]