output "vnet_id" {
  value = tomap({
    for k, s in data.azurerm_virtual_network.vnet : k => s.id
  })
}