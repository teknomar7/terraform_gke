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
| [null_resource.kubeconfig](https://registry.terraform.io/providers/hashicorp/null/3.2.1/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_repair"></a> [auto\_repair](#input\_auto\_repair) | Enable auto repair of nodes failing health checks | `bool` | `true` | no |
| <a name="input_auto_upgrade"></a> [auto\_upgrade](#input\_auto\_upgrade) | Enables auto upgrade of Kubernetes on nodes | `bool` | `true` | no |
| <a name="input_cluster_location"></a> [cluster\_location](#input\_cluster\_location) | Region or zone location of cluster master | `string` | `"us-east1-b"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Cluster name | `string` | n/a | yes |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Cluster deletion protection | `bool` | `false` | no |
| <a name="input_iam_roles"></a> [iam\_roles](#input\_iam\_roles) | List of IAM roles to assign to service account | `list(string)` | <pre>[<br>  "roles/container.nodeServiceAccount"<br>]</pre> | no |
| <a name="input_initial_node_count"></a> [initial\_node\_count](#input\_initial\_node\_count) | Initial node count | `number` | `1` | no |
| <a name="input_kubeconfig_download"></a> [kubeconfig\_download](#input\_kubeconfig\_download) | Autodownload kubeconfig (overwrites existing file in ~/.kube/config) | `bool` | `true` | no |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | Instance type for node pool | `string` | `"e2-small"` | no |
| <a name="input_network_policy_enabled"></a> [network\_policy\_enabled](#input\_network\_policy\_enabled) | Enables network policy | `bool` | `true` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | Number of nodes in the cluster | `number` | `1` | no |
| <a name="input_nodepool_location"></a> [nodepool\_location](#input\_nodepool\_location) | Region of nodepool location | `string` | `"us-east1-b"` | no |
| <a name="input_nodepool_name"></a> [nodepool\_name](#input\_nodepool\_name) | Nodepool name | `string` | n/a | yes |
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