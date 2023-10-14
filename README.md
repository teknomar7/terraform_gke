<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 5.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_container_cluster.primary](https://registry.terraform.io/providers/hashicorp/google/5.1.0/docs/resources/container_cluster) | resource |
| [google_container_node_pool.primary_preemptible_nodes](https://registry.terraform.io/providers/hashicorp/google/5.1.0/docs/resources/container_node_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_location"></a> [cluster\_location](#input\_cluster\_location) | Region or zone location of cluster master | `string` | `"us-east1-a"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Cluster name | `string` | n/a | yes |
| <a name="input_initial_node_count"></a> [initial\_node\_count](#input\_initial\_node\_count) | Initial node count | `number` | `1` | no |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | Instance type for node pool | `string` | `"e2-medium"` | no |
| <a name="input_nodepool_location"></a> [nodepool\_location](#input\_nodepool\_location) | Region of nodepool location | `string` | `"us-east1"` | no |
| <a name="input_nodepool_name"></a> [nodepool\_name](#input\_nodepool\_name) | Nodepool name | `string` | n/a | yes |
| <a name="input_preemptible"></a> [preemptible](#input\_preemptible) | Use preemptible instance types for nodepool | `bool` | `true` | no |
| <a name="input_project"></a> [project](#input\_project) | Project ID | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Default region | `string` | `"us-east1"` | no |
| <a name="input_remove_default_node_pool"></a> [remove\_default\_node\_pool](#input\_remove\_default\_node\_pool) | Delete the default node pool upon cluster creation | `bool` | `true` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->