<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_storage"></a> [storage](#module\_storage) | ../module/tfs_azurerm_storage | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_replication_type"></a> [account\_replication\_type](#input\_account\_replication\_type) | account replication type of storage account | `string` | n/a | yes |
| <a name="input_account_tier"></a> [account\_tier](#input\_account\_tier) | account tier of storage account | `string` | n/a | yes |
| <a name="input_container_access_type"></a> [container\_access\_type](#input\_container\_access\_type) | access type of storage account container | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | Environment | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of each resources | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | LocTagsation of each resources | `map(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->