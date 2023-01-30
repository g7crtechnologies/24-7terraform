.PHONY: init-kv-eu, init-kv-wu, plan-kv-eu, plan-kv-wu, apply-kv-eu, apply-kv-wu, plan-kv, apply-kv, help
module=DEFAULT
##
## init: run terraform init. usage: make init-{env} [ env = init-dev / init-prod ]
az-kv-eu:
	@az account set --name=sub-speech-hub
az-kv-wu:
	@az account set --name=sub-speech-hub


init-kv-eu: az-kv-eu
	@terraform init -backend-config=storage_account_name="tfsstghubtfstate" -backend-config=container_name="tfstate" -backend-config=key="eastus/keyvault/hub/default.tfstate" -backend-config=resource_group_name="tfs-rg-hub-tfstate" -upgrade -reconfigure -var-file=terraform_eu.tfvars
init-kv-wu: az-kv-wu
	@terraform init -backend-config=storage_account_name="tfsstghubtfstate" -backend-config=container_name="tfstate" -backend-config=key="westus/keyvault/hub/default.tfstate" -backend-config=resource_group_name="tfs-rg-hub-tfstate" -upgrade -reconfigure -var-file=terraform_wu.tfvars
## plan-kv-eu: run terraform plan on the kv-eu workspace. usage: make plan-kv-eu module=<module name>
plan-kv-eu: init-kv-eu
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-kv-wu: run terraform plan on the kv-wu workspace. usage: make plan-kv-wu module=<module name>
plan-kv-wu: init-kv-wu
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_wu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif


## apply-kv-eu: run terraform apply on the kv-eu workspace. usage: make apply-kv-eu module=<module name>
apply-kv-eu: init-kv-eu
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-kv-wu: run terraform apply on the kv-wu workspace. usage: make apply-kv-wu module=<module name>
apply-kv-wu: init-kv-wu
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_wu.tfvars -parallelism=20
	@cd .\env\ && make apply-mg
else
	@terraform apply -target=$(module)
endif
## plan whole variables
plan-mg: plan-kv-eu plan-kv-wu 
## apply on both region
apply-mg: apply-kv-eu apply-kv-wu

help: Makefile
	@sed -n 's/^##//p' $<

.DEFAULT_GOAL := help