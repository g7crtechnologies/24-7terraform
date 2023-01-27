.PHONY: init-cs-eu, init-cs-wu, plan-cs-eu, plan-cs-wu, apply-cs-eu, apply-cs-wu, plan-cs, apply-cs, help
module=DEFAULT
##
## init: run terraform init. usage: make init-{env} [ env = init-dev / init-prod ]
az-cs-eu:
	@az account set --name=sub-speech-hub
az-cs-wu:
	@az account set --name=sub-speech-hub


init-cs-eu: az-cs-eu
	@terraform init -backend-config=storage_account_name="tfsstrghubtfstate" -backend-config=container_name="tfstate" -backend-config=key="eastus/firewall/hub/default.tfstate" -backend-config=resource_group_name="tfs-rg-hub-eu-tfstate" -upgrade -reconfigure -var-file=terraform_eu.tfvars
init-cs-wu: az-cs-wu
	@terraform init -backend-config=storage_account_name="tfsstrghubtfstate" -backend-config=container_name="tfstate" -backend-config=key="westus/firewall/hub/default.tfstate" -backend-config=resource_group_name="tfs-rg-hub-wu-tfstate" -upgrade -reconfigure -var-file=terraform_wu.tfvars
## plan-cs-eu: run terraform plan on the cs-eu workspace. usage: make plan-cs-eu module=<module name>
plan-cs-eu: init-cs-eu
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-cs-wu: run terraform plan on the cs-wu workspace. usage: make plan-cs-wu module=<module name>
plan-cs-wu: init-cs-wu
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_wu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif


## apply-cs-eu: run terraform apply on the cs-eu workspace. usage: make apply-cs-eu module=<module name>
apply-cs-eu: init-cs-eu
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-cs-wu: run terraform apply on the cs-wu workspace. usage: make apply-cs-wu module=<module name>
apply-cs-wu: init-cs-wu
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_wu.tfvars -parallelism=20
	@cd .\env\ && make apply-mg
else
	@terraform apply -target=$(module)
endif
## plan whole variables
plan-mg: plan-cs-eu plan-cs-wu 
## apply on both region
apply-mg: apply-cs-eu apply-cs-wu

help: Makefile
	@sed -n 's/^##//p' $<

.DEFAULT_GOAL := help