#!/bin/bash

###########
# This script will list you your public GCP buckets.
#
# Run 'gcloud organizations list' to get your ORG_ID

if [[ -z $1 ]]; then
  echo "Please provide your ORG_ID. To find your ORG_ID use 'gcloud organizations list'"
  exit 1
else
  ORG_ID=$1
fi

gcloud alpha scc assets list ${ORG_ID} --filter "security_center_properties.resource_type = \"google.cloud.storage.bucket\" AND (resource_properties.acl:\"allAuthenticatedUsers\" OR resource_properties.acl:\"allUsers\" OR iamPolicy.policyBlob: \"allUsers\" OR iampolicy.policyBlob: \"allAuthenticatedUsers\")" --format json | jq '.[].asset.resourceProperties | {BucketLocation: .location, ProjectNumber: .projectNumber, BucketName: .name}'
