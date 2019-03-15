#!/bin/bash

set -e

rm -rf .terraform terraform.tfstate terraform.tfstate.backup

terraform init
terraform get

if [ "$APPLY_CHANGES" == "true" ] 
then
	terraform apply -auto-approve 
else
	terraform plan
fi

terraform show