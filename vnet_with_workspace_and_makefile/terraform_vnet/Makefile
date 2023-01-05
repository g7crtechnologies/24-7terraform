.PHONY: init-dev, init-prod, init-hub, init-prod, init-psr, init-qa, init-stg, init-stb, plan-dev, plan-prod, plan-psr, plan-qa, plan-stg, plan-stb, apply-dev, apply-prod, apply-psr, apply-qa, apply-stg, apply-stb, help
module=DEFAULT
varfile=terraform.tfvars

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

init-dev: az-dev
	@terraform init -backend-config=storage_account_name="managementgroup123" -backend-config=container_name="managementgroup" -backend-config=resource_group_name="management_group" -upgrade -reconfigure -var-file=$(varfile)
init-prod: az-prod
	@terraform init -backend-config=storage_account_name="managementgroup123" -backend-config=container_name="managementgroup" -backend-config=resource_group_name="management_group" -upgrade -reconfigure -var-file=$(varfile)
init-hub: az-hub
	@terraform init -backend-config=storage_account_name="managementgroup123" -backend-config=container_name="managementgroup" -backend-config=resource_group_name="management_group" -upgrade -reconfigure -var-file=$(varfile)
init-psr: az-psr
	@terraform init -backend-config=storage_account_name="managementgroup123" -backend-config=container_name="managementgroup" -backend-config=resource_group_name="management_group" -upgrade -reconfigure -var-file=$(varfile)
init-qa: az-qa
	@terraform init -backend-config=storage_account_name="managementgroup123" -backend-config=container_name="managementgroup" -backend-config=resource_group_name="management_group" -upgrade -reconfigure -var-file=$(varfile)
init-stg: az-stg
	@terraform init -backend-config=storage_account_name="managementgroup123" -backend-config=container_name="managementgroup" -backend-config=resource_group_name="management_group" -upgrade -reconfigure -var-file=$(varfile)
init-stb: az-stb
	@terraform init -backend-config=storage_account_name="managementgroup123" -backend-config=container_name="managementgroup" -backend-config=resource_group_name="management_group" -upgrade -reconfigure -var-file=$(varfile)

## plan-dev: run terraform plan on the staging workspace. usage: make plan-dev module=<module name>
plan-dev: init-dev
	@terraform workspace select dev
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=$(varfile) -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-prod: run terraform plan on the prod workspace. usage: make plan-prod module=<module name>
plan-prod: init-prod
	@terraform workspace select prod
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=$(varfile) -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-hub: run terraform plan on the hub workspace. usage: make plan-hub module=<module name>
plan-hub: init-hub
	@terraform workspace select hub
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=$(varfile) -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-psr: run terraform plan on the psr workspace. usage: make plan-psr module=<module name>
plan-psr: init-psr
	@terraform workspace select psr
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=$(varfile) -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-qa: run terraform plan on the qa workspace. usage: make plan-qa module=<module name>
plan-qa: init-qa
	@terraform workspace select qa
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=$(varfile) -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-stg: run terraform plan on the stg workspace. usage: make plan-stg module=<module name>
plan-stg: init-stg
	@terraform workspace select stg
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=$(varfile) -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-stb: run terraform plan on the stb workspace. usage: make plan-stb module=<module name>
plan-stb: init-stb
	@terraform workspace select stb
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=$(varfile) -parallelism=20
else
	@terraform plan -target=$(module)
endif

## apply-dev: run terraform apply on the dev workspace. usage: make apply-dev module=<module name>
apply-dev: init-dev
	@terraform workspace select dev
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=$(varfile) -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-prod: run terraform apply on the prod workspace. usage: make apply-prod module=<module name>
apply-prod: init-prod
	@terraform workspace select prod
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=$(varfile) -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-hub: run terraform apply on the hub workspace. usage: make apply-hub module=<module name>
apply-hub: init-hub
	@terraform workspace select hub
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=$(varfile) -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-psr: run terraform apply on the psr workspace. usage: make apply-psr module=<module name>
apply-psr: init-psr
	@terraform workspace select psr
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=$(varfile) -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-qa: run terraform apply on the qa workspace. usage: make apply-qa module=<module name>
apply-qa: init-qa
	@terraform workspace select qa
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=$(varfile) -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-stg: run terraform apply on the stg workspace. usage: make apply-stg module=<module name>
apply-stg: init-stg
	@terraform workspace select stg
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=$(varfile) -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-stb: run terraform apply on the stb workspace. usage: make apply-stb module=<module name>
apply-stb: init-stb
	@terraform workspace select stb
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=$(varfile) -parallelism=20
else
	@terraform apply -target=$(module)
endif

##
help: Makefile
	@sed -n 's/^##//p' $<

.DEFAULT_GOAL := help
