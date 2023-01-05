output "vnet_id" {
  value = tomap({
    for k, s in azurerm_virtual_network.vnet : k => s.id
  })
}
