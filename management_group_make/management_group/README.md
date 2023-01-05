<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.29.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.29.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_mg"></a> [mg](#module\_mg) | ../module | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.0/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | n/a | `string` | `"hub"` | no |
| <a name="input_key_vault_name"></a> [key\_vault\_name](#input\_key\_vault\_name) | n/a | `string` | `"managementgroup1"` | no |
| <a name="input_key_vault_rg_name"></a> [key\_vault\_rg\_name](#input\_key\_vault\_rg\_name) | n/a | `string` | `"management_group"` | no |
| <a name="input_parent_management_group_id"></a> [parent\_management\_group\_id](#input\_parent\_management\_group\_id) | n/a | `string` | `""` | no |
| <a name="input_parent_management_group_name"></a> [parent\_management\_group\_name](#input\_parent\_management\_group\_name) | n/a | `string` | `null` | no |
| <a name="input_pid"></a> [pid](#input\_pid) | n/a | `bool` | `true` | no |
| <a name="input_remote_state"></a> [remote\_state](#input\_remote\_state) | n/a | `string` | `null` | no |
| <a name="input_secrets_name"></a> [secrets\_name](#input\_secrets\_name) | n/a | `string` | `"sub-hub"` | no |
| <a name="input_subscription_enable"></a> [subscription\_enable](#input\_subscription\_enable) | n/a | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mg_id"></a> [mg\_id](#output\_mg\_id) | n/a |
<!-- END_TF_DOCS -->