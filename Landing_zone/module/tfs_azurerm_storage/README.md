<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_storage_account.storageacc](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_container.container](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [terraform_remote_state.rg](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_replication_type"></a> [account\_replication\_type](#input\_account\_replication\_type) | Account replication type for storage account | `string` | n/a | yes |
| <a name="input_account_tier"></a> [account\_tier](#input\_account\_tier) | Account tier for storage account | `string` | n/a | yes |
| <a name="input_container_access_type"></a> [container\_access\_type](#input\_container\_access\_type) | Access type for storage account Container | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | Environment | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of Resources | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for every resources | `map(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->