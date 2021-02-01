# Cloud Run Automation and Pipelining

How to you adopt DevOps practices to deploy and maintain your Cloud Run services in GCP?



## Initalisation or Initial Deployment of Service

### Terrafrom

A Terraform module exists that allows you to manage the following;
* Resources
    * [Domain Mapping](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_domain_mapping)
    * [Cloud Run Service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service)
    * [Cloud Run IAM](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service_iam)
* Data Sources
    * [Locations](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/cloud_run_locations)
    * [Service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/cloud_run_service)



Buildpacks?    

## Progressive Rollout 

Pipeline with buildpacks