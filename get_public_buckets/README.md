# get_public_buckets.sh

Use the asset inventory of GCP [Cloud Security Command Center](https://cloud.google.com/security-command-center/) to list all your public buckets.

# Usage

## Requirements
1. Have gcloud alpha installed and configured
2. Have jq installed
3. You need to have access to your GCP Cloud Security Command Center

## CLI

```
$ ./get_public_buckets.sh <YOUR_ORG_ID>
```

## Example

### Get you organization ID
```
$ gcloud organizations list:
DISPLAY_NAME                ID  DIRECTORY_CUSTOMER_ID
secret-org-name.org  31337	chaiZish9noh
```

### Call script with organization ID
```
$ ./get_public_buckets.sh 31337
{
  "BucketLocation": "EU",
  "ProjectNumber": "123456789012",
  "BucketName": "bucket1-gcp-secret-stuff"
}
{
  "BucketLocation": "EUROPE-WEST1",
  "ProjectNumber": "123456789876",
  "BucketName": "bucket2-public-images"
}
```
