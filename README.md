# terraform_gke

Note:  This is currently a personal project that is a WIP.  This is in no way production ready.

Terraform repo designed to build a GKE cluster.

## Prerequisites

The following are prerequisites to run this code.  This has been tested on MacOS with the packages below being installed with [Homebrew](https://brew.sh/). The packages listed below are named to match the brew package name.

- google-cloud-sdk (This is installed as a cask; `brew install --cask google-cloud-sdk`)
- terraform
- kubernetes-cli

Additionally, you will need to create an account and project on Google Cloud, along with a billing account and associate the two.

## Authentication

Begin by initializing the sdk (required only once after installing the sdk):  `gcloud init`

NOTE:  I'm not sure if both of the auth commands below are required, will refine docs after futher testing.

Run the following two authentication commands.  These will redirect you to a webpage to authenticate with your Google account.

`gcloud auth application-default login`
`gcloud auth login`

## Usage

To begin, clone a local copy of this repository to you machine:  `git clone https://github.com/teknomar7/terraform_gke.git`

### Input vars

Before running this code, you will need to create a `terraform.tfvars` file in the root directory of the project.  Define required variables and those which you would like to override as defined in the `variables.tf`

If you do not provide the aforementioned file, running the code will prompt you at the cli for any required variables which are not defined.

### Execution

After completing the aformentioned prerequisites, use the following commands to execute terraform:

`terraform init` - This will initialize the codebase and download the required provider files.

`terraform plan` - This is not required, but is a dry-run of what will be built and will provide some validation of you local setup and connectivity.  

`terraform apply` - This will execute this code and build the GKE cluster in Google Cloud.

`terraform destroy` - This will destroy all resources build with this code.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 5.1.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | 3.2.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.1.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_container_cluster.primary](https://registry.terraform.io/providers/hashicorp/google/5.1.0/docs/resources/container_cluster) | resource |
| [google_container_node_pool.primary_nodes](https://registry.terraform.io/providers/hashicorp/google/5.1.0/docs/resources/container_node_pool) | resource |
| [google_project_iam_member.project](https://registry.terraform.io/providers/hashicorp/google/5.1.0/docs/resources/project_iam_member) | resource |
| [google_service_account.gke_sa](https://registry.terraform.io/providers/hashicorp/google/5.1.0/docs/resources/service_account) | resource |
| [null_resource.enable_kubernetes_engine](https://registry.terraform.io/providers/hashicorp/null/3.2.1/docs/resources/resource) | resource |
| [null_resource.kubeconfig](https://registry.terraform.io/providers/hashicorp/null/3.2.1/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_repair"></a> [auto\_repair](#input\_auto\_repair) | Enable auto repair of nodes failing health checks | `bool` | `true` | no |
| <a name="input_auto_upgrade"></a> [auto\_upgrade](#input\_auto\_upgrade) | Enables auto upgrade of Kubernetes on nodes | `bool` | `true` | no |
| <a name="input_cluster_location"></a> [cluster\_location](#input\_cluster\_location) | Region or zone location of cluster master | `string` | `"us-east1-b"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Cluster name | `string` | n/a | yes |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Cluster deletion protection | `bool` | `false` | no |
| <a name="input_iam_roles"></a> [iam\_roles](#input\_iam\_roles) | List of IAM roles to assign to service account | `list(string)` | <pre>[<br>  "roles/container.nodeServiceAccount",<br>  "roles/clouddebugger.agent",<br>  "roles/cloudprofiler.agent",<br>  "roles/cloudtrace.agent",<br>  "roles/monitoring.metricWriter"<br>]</pre> | no |
| <a name="input_initial_node_count"></a> [initial\_node\_count](#input\_initial\_node\_count) | Initial node count | `number` | `1` | no |
| <a name="input_kubeconfig_download"></a> [kubeconfig\_download](#input\_kubeconfig\_download) | Autodownload kubeconfig (overwrites existing file in ~/.kube/config) | `bool` | `true` | no |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | Instance type for node pool | `string` | `"e2-small"` | no |
| <a name="input_network_policy_enabled"></a> [network\_policy\_enabled](#input\_network\_policy\_enabled) | Enables network policy | `bool` | `true` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | Number of nodes in the cluster | `number` | `1` | no |
| <a name="input_nodepool_location"></a> [nodepool\_location](#input\_nodepool\_location) | Region of nodepool location | `string` | `"us-east1-b"` | no |
| <a name="input_nodepool_name"></a> [nodepool\_name](#input\_nodepool\_name) | Nodepool name | `string` | n/a | yes |
| <a name="input_oauth_scopes"></a> [oauth\_scopes](#input\_oauth\_scopes) | OAuth scopes of the node. Full list can be found at https://developers.google.com/identity/protocols/oauth2/scopes | `list(string)` | <pre>[<br>  "https://www.googleapis.com/auth/devstorage.read_only",<br>  "https://www.googleapis.com/auth/logging.write",<br>  "https://www.googleapis.com/auth/monitoring",<br>  "https://www.googleapis.com/auth/servicecontrol",<br>  "https://www.googleapis.com/auth/service.management.readonly",<br>  "https://www.googleapis.com/auth/trace.append",<br>  "https://www.googleapis.com/auth/cloud-platform"<br>]</pre> | no |
| <a name="input_preemptible"></a> [preemptible](#input\_preemptible) | Enables preemptible instance types for nodepool | `bool` | `true` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project ID | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Default region | `string` | `"us-east1"` | no |
| <a name="input_remove_default_node_pool"></a> [remove\_default\_node\_pool](#input\_remove\_default\_node\_pool) | Delete the default node pool upon cluster creation | `bool` | `true` | no |
| <a name="input_workload_metadata_enabled"></a> [workload\_metadata\_enabled](#input\_workload\_metadata\_enabled) | Enables workload metadata at the node level | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | IP of the cluster master |
| <a name="output_id"></a> [id](#output\_id) | Cluster identifier |
| <a name="output_master_version"></a> [master\_version](#output\_master\_version) | Current Kubernetes version of the master |
| <a name="output_self_link"></a> [self\_link](#output\_self\_link) | Server-defined URL for the resource |
<!-- END_TF_DOCS -->