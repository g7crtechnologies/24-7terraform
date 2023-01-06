data "azurerm_management_group" "mg" {
  display_name = var.display_name
}

resource "azurerm_management_group_policy_assignment" "policies" {
  for_each             = var.policy
  name                 = each.value["name"]
  display_name         = each.value["display_name"]
  description          = each.value["description"]
  policy_definition_id = each.value["policy_definition_id"]
  management_group_id  = data.azurerm_management_group.mg.id
  enforce              = false
  # parameters = jsonencode({
  #   effect : {
  #     value : each.key
  #   }
  # })
}



