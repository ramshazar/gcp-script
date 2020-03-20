# get_project_for_ip.sh

Use the asset inventory of GCP [Cloud Security Command Center](https://cloud.google.com/security-command-center/) to find out which of your projets an ip address belongs to

# Usage

## Requirements
1. Have gcloud alpha installed and configured
2. Have jq installed
3. You need to have access to your GCP Cloud Security Command Center
4. The ip address must be an asset of your organisation

## CLI

```
$ ./get_project_for_ip.sh <YOUR_ORG_ID> <V4IP>
```

## Example

### Get you organization ID
```
$ gcloud organizations list:
DISPLAY_NAME                ID  DIRECTORY_CUSTOMER_ID
secret-org-name.org  31337	chaiZish9noh
```

### Call script with organization ID and ip address
```
$ ./get_project_for_ip.sh 31337 1.3.3.7
{
  "Address": "1.3.3.7",
  "AddressType": "EXTERNAL",
  "ProjectDisplayName": "steady-project",
  "AddressName": "santa-claus-test-address",
  "SelfLink": "https://www.googleapis.com/compute/v1/projects/steady-project/global/addresses/santa-claus-test-address"
}
```
