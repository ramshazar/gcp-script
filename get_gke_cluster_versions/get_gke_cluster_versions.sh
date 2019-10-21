#!/bin/bash

ORG_ID=$1

if [ "$#" -ne 1 ]
then
  echo "Usage: Please provide the ID of the organization"
  exit 1
fi

if ! [ -x "$(command -v jq)" ]; then
  echo 'Error: jq is not installed.' >&2
  exit 1
fi

gcloud alpha scc assets list ${ORG_ID} --filter "security_center_properties.resource_type = \"google.container.Cluster\"" --format json | jq '.[].asset | {Cluster: .resourceProperties.selfLink, MasterVersion: .resourceProperties.currentMasterVersion, MasterAuthorizedNetworks: .resourceProperties.masterAuthorizedNetworksConfig, Owner: .securityCenterProperties.resourceOwners}'
