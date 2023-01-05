.PHONY: init-dev, init-prod, init-hub, init-prod, init-iac, init-qa, init-stg, init-stb, init-products, init-speech-application, plan-dev, plan-hub plan-prod, plan-iac, plan-qa, plan-stg, plan-stb, plan-products, plan-speech-application, apply-dev, apply-hub apply-prod, apply-iac, apply-qa, apply-stg, apply-stb, apply-products, apply-speech-application, plan-mg, help
module=DEFAULT
approve=-auto-approve
##
## init: run terraform init. usage: make init-{env} [ env = init-dev / init-prod ]
az-dev:
	@az account set --name=Gaurav-and-Pulluru-MSDN
az-prod:
	@az account set --name=Gaurav-and-Pulluru-MSDN
az-hub:
	@az account set --name=Gaurav-and-Pulluru-MSDN
az-iac:
	@az account set --name=Gaurav-and-Pulluru-MSDN
az-qa:
	@az account set --name=Gaurav-and-Pulluru-MSDN
az-stg:
	@az account set --name=Gaurav-and-Pulluru-MSDN
az-stb:
	@az account set --name=Gaurav-and-Pulluru-MSDN
az-products:
	@az account set --name=Gaurav-and-Pulluru-MSDN
az-speech-application:
	@az account set --name=Gaurav-and-Pulluru-MSDN

init-dev: az-dev
	@terraform init -backend-config=storage_account_name="managementgroup123" -backend-config=container_name="managementgroup" -backend-config=key="mg/products/speech-application/dev/default.tfstate" -backend-config=resource_group_name="management_group" -upgrade -reconfigure -var-file=dev.tfvars
init-prod: az-prod
	@terraform init -backend-config=storage_account_name="managementgroup123" -backend-config=container_name="managementgroup" -backend-config=key="mg/products/speech-application/prod/default.tfstate" -backend-config=resource_group_name="management_group" -upgrade -reconfigure -var-file=prod.tfvars
init-hub: az-hub
	@terraform init -backend-config=storage_account_name="managementgroup123" -backend-config=container_name="managementgroup" -backend-config=key="mg/hub/default.tfstate" -backend-config=resource_group_name="management_group" -upgrade -reconfigure -var-file=hub.tfvars
init-iac: az-iac
	@terraform init -backend-config=storage_account_name="managementgroup123" -backend-config=container_name="managementgroup" -backend-config=key="mg/iac/default.tfstate" -backend-config=resource_group_name="management_group" -upgrade -reconfigure -var-file=iac.tfvars
init-qa: az-qa
	@terraform init -backend-config=storage_account_name="managementgroup123" -backend-config=container_name="managementgroup" -backend-config=key="mg/products/speech-application/qa/default.tfstate" -backend-config=resource_group_name="management_group" -upgrade -reconfigure -var-file=qa.tfvars
init-stg: az-stg
	@terraform init -backend-config=storage_account_name="managementgroup123" -backend-config=container_name="managementgroup" -backend-config=key="mg/products/speech-application/stg/default.tfstate" -backend-config=resource_group_name="management_group" -upgrade -reconfigure -var-file=staging.tfvars
init-stb: az-stb
	@terraform init -backend-config=storage_account_name="managementgroup123" -backend-config=container_name="managementgroup" -backend-config=key="mg/products/speech-application/stb/default.tfstate" -backend-config=resource_group_name="management_group" -upgrade -reconfigure -var-file=stb.tfvars
init-products: az-products
	@terraform init -backend-config=storage_account_name="managementgroup123" -backend-config=container_name="managementgroup" -backend-config=key="mg/products/default.tfstate" -backend-config=resource_group_name="management_group" -upgrade -reconfigure -var-file=products.tfvars
init-speech-application: az-speech-application
	@terraform init -backend-config=storage_account_name="managementgroup123" -backend-config=container_name="managementgroup" -backend-config=key="mg/products/speech-application/default.tfstate" -backend-config=resource_group_name="management_group" -upgrade -reconfigure -var-file=speech_application.tfvars

## plan-dev: run terraform plan on the staging workspace. usage: make plan-dev module=<module name>
plan-dev: init-dev
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=dev.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-prod: run terraform plan on the prod workspace. usage: make plan-prod module=<module name>
plan-prod: init-prod
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=prod.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-hub: run terraform plan on the hub workspace. usage: make plan-hub module=<module name>
plan-hub: init-hub
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=hub.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-iac: run terraform plan on the iac workspace. usage: make plan-iac module=<module name>
plan-iac: init-iac
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=iac.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-qa: run terraform plan on the qa workspace. usage: make plan-qa module=<module name>
plan-qa: init-qa
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=qa.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-stg: run terraform plan on the stg workspace. usage: make plan-stg module=<module name>
plan-stg: init-stg
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=staging.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-stb: run terraform plan on the stb workspace. usage: make plan-stb module=<module name>
plan-stb: init-stb
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=stb.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-products: run terraform plan on the products workspace. usage: make plan-products module=<module name>
plan-products: init-products
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=products.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-speech-application: run terraform plan on the speech-application workspace. usage: make plan-speech-application module=<module name>
plan-speech-application: init-speech-application
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=speech_application.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## apply-dev: run terraform apply on the dev workspace. usage: make apply-dev module=<module name>
apply-dev: init-dev
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=dev.tfvars $(approve) -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-prod: run terraform apply on the prod workspace. usage: make apply-prod module=<module name>
apply-prod: init-prod
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=prod.tfvars $(approve) -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-hub: run terraform apply on the hub workspace. usage: make apply-hub module=<module name>
apply-hub: init-hub
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=hub.tfvars $(approve) -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-iac: run terraform apply on the iac workspace. usage: make apply-iac module=<module name>
apply-iac: init-iac
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=iac.tfvars $(approve) -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-qa: run terraform apply on the qa workspace. usage: make apply-qa module=<module name>
apply-qa: init-qa
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=qa.tfvars $(approve) -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-stg: run terraform apply on the stg workspace. usage: make apply-stg module=<module name>
apply-stg: init-stg
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=staging.tfvars $(approve) -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-stb: run terraform apply on the stb workspace. usage: make apply-stb module=<module name>
apply-stb: init-stb
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=stb.tfvars $(approve) -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-products: run terraform apply on the products workspace. usage: make apply-products module=<module name>
apply-products: init-products
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=products.tfvars $(approve) -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-speech-application: run terraform apply on the speech-application workspace. usage: make apply-speech-application module=<module name>
apply-speech-application: init-speech-application
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=speech_application.tfvars $(approve) -parallelism=20
	@cd .\env\ && make apply-mg
else
	@terraform apply -target=$(module)
endif
## plan whole variables
plan-mg: plan-speech-application 
##
apply-mg: apply-speech-application
help: Makefile
	@sed -n 's/^##//p' $<

.DEFAULT_GOAL := help