.PHONY: init-dev-eu, init-prod-eu, init-hub-eu, init-psr-eu, init-qa-eu, init-stg-eu, init-stb-eu, plan-dev-eu, plan-prod-eu, plan-hub-eu, plan-psr-eu, plan-qa-eu, plan-stg-eu, plan-stb-eu, apply-dev-eu, apply-prod-eu, apply-hub-eu, apply-psr-eu, apply-qa-eu, apply-stg-eu, apply-stb-eu, init-dev-wu, init-prod-wu, init-hub-wu, init-prod-wu, init-hub-wu, init-psr-wu, init-qa-wu, init-stg-wu, init-stb-wu, plan-prod-wu, plan-hub-wu, plan-psr-wu, plan-stg-wu, plan-stb-wu, apply-prod-wu, apply-hub-wu, apply-psr-wu, apply-stg-wu, apply-stb-wu, plan-eu, plan-wu, apply-eu, apply-wu, env, help
module=DEFAULT
##   make apply-<env_name that is mentioned in makefile > -varfile=terraform_eu.tfvars or terraform_wu.tfvars

## init: run terraform init. usage: make init-{env} [ env = init-dev / init-prod ]
## set subscription for different different env 
az-dev:
	@az account set --name=Gaurav-and-Pulluru-MSDN
az-prod:
	@az account set --name=Gaurav-and-Pulluru-MSDN
az-hub:
	@az account set --name=Gaurav-and-Pulluru-MSDN
az-psr:
	@az account set --name=Gaurav-and-Pulluru-MSDN
az-qa:
	@az account set --name=Gaurav-and-Pulluru-MSDN
az-stg:
	@az account set --name=Gaurav-and-Pulluru-MSDN
az-stb:
	@az account set --name=Gaurav-and-Pulluru-MSDN

init-dev-eu: az-dev
	@terraform init -backend-config=storage_account_name="managementgroup123" -backend-config=container_name="managementgroup" -backend-config=key="east-us/dev/default.tfstate" -backend-config=resource_group_name="management_group" -upgrade -reconfigure -var-file=terraform_eu.tfvars
init-prod-eu: az-prod
	@terraform init -backend-config=storage_account_name="managementgroup123" -backend-config=container_name="managementgroup" -backend-config=key="east-us/prod/default.tfstate" -backend-config=resource_group_name="management_group" -upgrade -reconfigure -var-file=terraform_eu.tfvars
init-hub-eu: az-hub
	@terraform init -backend-config=storage_account_name="managementgroup123" -backend-config=container_name="managementgroup" -backend-config=key="east-us/hub/default.tfstate" -backend-config=resource_group_name="management_group" -upgrade -reconfigure -var-file=terraform_eu.tfvars
init-psr-eu: az-psr
	@terraform init -backend-config=storage_account_name="managementgroup123" -backend-config=container_name="managementgroup" -backend-config=key="east-us/psr/default.tfstate" -backend-config=resource_group_name="management_group" -upgrade -reconfigure -var-file=terraform_eu.tfvars
init-qa-eu: az-qa
	@terraform init -backend-config=storage_account_name="managementgroup123" -backend-config=container_name="managementgroup" -backend-config=key="east-us/qa/default.tfstate" -backend-config=resource_group_name="management_group" -upgrade -reconfigure -var-file=terraform_eu.tfvars
init-stg-eu: az-stg
	@terraform init -backend-config=storage_account_name="managementgroup123" -backend-config=container_name="managementgroup" -backend-config=key="east-us/stg/default.tfstate" -backend-config=resource_group_name="management_group" -upgrade -reconfigure -var-file=terraform_eu.tfvars
init-stb-eu: az-stb
	@terraform init -backend-config=storage_account_name="managementgroup123" -backend-config=container_name="managementgroup" -backend-config=key="east-us/stb/default.tfstate" -backend-config=resource_group_name="management_group" -upgrade -reconfigure -var-file=terraform_eu.tfvars

## plan-dev: run terraform plan on the staging workspace. usage: make plan-dev module=<module name>
plan-dev-eu: init-dev-eu
	@terraform workspace select dev
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-prod: run terraform plan on the prod workspace. usage: make plan-prod module=<module name>
plan-prod-eu: init-prod-eu
	@terraform workspace select prod
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-hub: run terraform plan on the hub workspace. usage: make plan-hub module=<module name>
plan-hub-eu: init-hub-eu
	@terraform workspace select hub
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-psr: run terraform plan on the psr workspace. usage: make plan-psr module=<module name>
plan-psr-eu: init-psr-eu
	@terraform workspace select psr
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-qa: run terraform plan on the qa workspace. usage: make plan-qa module=<module name>
plan-qa-eu: init-qa-eu
	@terraform workspace select qa
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-stg: run terraform plan on the stg workspace. usage: make plan-stg module=<module name>
plan-stg-eu: init-stg-eu
	@terraform workspace select stg
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-stb: run terraform plan on the stb workspace. usage: make plan-stb module=<module name>
plan-stb-eu: init-stb-eu
	@terraform workspace select stb
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## apply-dev: run terraform apply on the dev workspace. usage: make apply-dev module=<module name>
apply-dev-eu: init-dev-eu
	@terraform workspace select dev
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-prod: run terraform apply on the prod workspace. usage: make apply-prod module=<module name>
apply-prod-eu: init-prod-eu
	@terraform workspace select prod
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-hub: run terraform apply on the hub workspace. usage: make apply-hub module=<module name>
apply-hub-eu: init-hub-eu
	@terraform workspace select hub
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-psr: run terraform apply on the psr workspace. usage: make apply-psr module=<module name>
apply-psr-eu: init-psr-eu
	@terraform workspace select psr
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-qa: run terraform apply on the qa workspace. usage: make apply-qa module=<module name>
apply-qa-eu: init-qa-eu
	@terraform workspace select qa
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-stg: run terraform apply on the stg workspace. usage: make apply-stg module=<module name>
apply-stg-eu: init-stg-eu
	@terraform workspace select stg
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-stb: run terraform apply on the stb workspace. usage: make apply-stb module=<module name>
apply-stb-eu: init-stb-eu
	@terraform workspace select stb
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform apply -target=$(module)
endif



                                                                                      #### weat-us region



init-prod-wu: az-prod
	@terraform init -backend-config=storage_account_name="managementgroup123" -backend-config=container_name="managementgroup" -backend-config=key="west-us/prod/default.tfstate" -backend-config=resource_group_name="management_group" -upgrade -reconfigure -var-file=terraform_wu.tfvars
init-hub-wu: az-hub
	@terraform init -backend-config=storage_account_name="managementgroup123" -backend-config=container_name="managementgroup" -backend-config=key="west-us/hub/default.tfstate" -backend-config=resource_group_name="management_group" -upgrade -reconfigure -var-file=terraform_wu.tfvars
init-psr-wu: az-psr
	@terraform init -backend-config=storage_account_name="managementgroup123" -backend-config=container_name="managementgroup" -backend-config=key="west-us/psr/default.tfstate" -backend-config=resource_group_name="management_group" -upgrade -reconfigure -var-file=terraform_wu.tfvars
init-stg-wu: az-stg
	@terraform init -backend-config=storage_account_name="managementgroup123" -backend-config=container_name="managementgroup" -backend-config=key="west-us/stg/default.tfstate" -backend-config=resource_group_name="management_group" -upgrade -reconfigure -var-file=terraform_wu.tfvars
init-stb-wu: az-stb
	@terraform init -backend-config=storage_account_name="managementgroup123" -backend-config=container_name="managementgroup" -backend-config=key="west-us/stb/default.tfstate" -backend-config=resource_group_name="management_group" -upgrade -reconfigure -var-file=terraform_wu.tfvars

## plan-prod: run terraform plan on the prod workspace. usage: make plan-prod module=<module name>
plan-prod-wu: init-prod-wu
	@terraform workspace select prod
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_wu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-hub: run terraform plan on the hub workspace. usage: make plan-hub module=<module name>
plan-hub-wu: init-hub-wu
	@terraform workspace select hub
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_wu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-psr: run terraform plan on the psr workspace. usage: make plan-psr module=<module name>
plan-psr-wu: init-psr-wu
	@terraform workspace select psr
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_wu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-stg: run terraform plan on the stg workspace. usage: make plan-stg module=<module name>
plan-stg-wu: init-stg-wu
	@terraform workspace select stg
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_wu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-stb: run terraform plan on the stb workspace. usage: make plan-stb module=<module name>
plan-stb-wu: init-stb-wu
	@terraform workspace select stb
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_wu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## apply-prod: run terraform apply on the prod workspace. usage: make apply-prod module=<module name>
apply-prod-wu: init-prod-wu
	@terraform workspace select prod
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_wu.tfvars -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-hub: run terraform apply on the hub workspace. usage: make apply-hub module=<module name>
apply-hub-wu: init-hub-wu
	@terraform workspace select hub
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_wu.tfvars -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-psr: run terraform apply on the psr workspace. usage: make apply-psr module=<module name>
apply-psr-wu: init-psr-wu
	@terraform workspace select psr
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_wu.tfvars -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-stg: run terraform apply on the stg workspace. usage: make apply-stg module=<module name>
apply-stg-wu: init-stg-wu
	@terraform workspace select stg
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_wu.tfvars -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-stb: run terraform apply on the stb workspace. usage: make apply-stb module=<module name>
apply-stb-wu: init-stb-wu
	@terraform workspace select stb
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_wu.tfvars -parallelism=20
else
	@terraform apply -target=$(module)
endif

env:
	@terraform workspace new dev && terraform workspace new prod && terraform workspace new hub && terraform workspace new psr && terraform workspace new qa && terraform workspace new stg && terraform workspace new stb

plan-eu: plan-dev-eu plan-prod-eu plan-hub-eu plan-psr-eu plan-qa-eu plan-stg-eu plan-stb-eu 

apply-eu: apply-dev-eu apply-prod-eu apply-hub-eu apply-psr-eu apply-qa-eu apply-stg-eu apply-stb-eu

plan-wu: plan-prod-wu plan-hub-wu plan-psr-wu plan-stg-wu plan-stb-wu

apply-wu: apply-prod-wu apply-hub-wu apply-psr-wu apply-stg-wu apply-stb-wu
##
help: Makefile
	@sed -n 's/^##//p' $<

.DEFAULT_GOAL := help
