#!/bin/bash

###########
# This script enables you to find ot in which GCP project an ip address is used
# You need access to your Cloud Security Command Center
#
# Run 'gcloud organizations list' to get your ORG_ID

if [[ -z $1 ]]; then
  echo "Please provide your ORG_ID. To find your ORG_ID use 'gcloud organizations list'"
  exit 1
else
  ORG_ID=$1
fi

if [[ -z $2 ]]; then
  echo "Please provide an ip address."
  exit 1
else
  IP=$2
fi

gcloud alpha scc assets list ${ORG_ID} \
--filter "security_center_properties.resource_type = \"google.compute.Address\" AND  resource_properties.address:\"${IP}\"" \
--format json | jq '.[].asset | {Address: .resourceProperties.address, AddressType: .resourceProperties.addressType, ProjectDisplayName: .securityCenterProperties.resourceProjectDisplayName, AddressName: .securityCenterProperties.resourceDisplayName, SelfLink: .resourceProperties.selfLink}'
