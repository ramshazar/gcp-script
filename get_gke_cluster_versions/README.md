# get_gke_cluster_versions.sh

Use the asset inventory of GCP [Cloud Security Command Center](https://cloud.google.com/security-command-center/) to list all you GKE Kubernetes Clusters.

# Usage

## Requirements
1. Have gcloud installed and configured
2. Have jq installed
3. You need to have access to your GCP Cloud Security Command Center

## CLI

./get_gke_cluster_versions.sh <YOUR_ORG_ID>

## Example

```
./get_gke_cluster_versions.sh 31337
{
  "Cluster": "https://container.googleapis.com/v1/projects/my-first-project/locations/europe-west1/clusters/kubernetes",
  "MasterVersion": "1.12.9-gke.15",
  "MasterAuthorizedNetworks": "{\"cidrBlocks\":[{\"cidrBlock\":\"1.2.3.4/32\"},{\"cidrBlock\":\"4.7.1.1/32\"}],\"enabled\":true}",
  "Owner": [
    "user:root@gmail.com"
  ]
}
{
  "Cluster": "https://container.googleapis.com/v1/projects/my-second-project/zones/europe-west1-c/clusters/testcluster",
  "MasterVersion": "1.12.10-gke.15",
  "MasterAuthorizedNetworks": null,
  "Owner": [
    "user:root@gmail.com"
    "user:another.user@gmail.com"
    "user:we.should.use.groups.for.this@gmail.com"
  ]
}
```
