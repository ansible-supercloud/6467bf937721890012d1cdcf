# Customer Care

Solution based on IBM Simple VPC OpenShift, IBM - ODF Cluster Storage and Cloud Pak for Data Foundation in Quick-Start reference architecture deployed on IBM

## Running the automation

There are three different options for how to configure and run the automation:

- Interactive prompts
- Yaml configuration
- Terraform configuration

### Interactive prompts

In this mode, you will be prompted interactively for the variables required to run the automation.

1. Run the `apply.sh` script
2. At each prompt, provide a value for the variable.
3. Once all the variables are collected, you will be asked to apply the automation. Enter `y` to continue or `n` to stop. Either way, the values provided have been collected and written to two sets of files so that next time you can skip the prompts.

The `apply.sh` script will generate credentials.yaml and variables.yaml input files that can be used
for future deployments as well as generating the credentials.auto.tfvars and terraform.tfvars files
used by the terraform. The variables.yaml and terraform.tfvars files can be checked in with the terraform
templates. However, credentials.yaml and credentials.auto.tfvars should be excluded since they contain
sensitive information. Those files should already be included in the .gitignore file.

### Yaml configuration

In this mode, you provide the configuration for your instance in yaml configuration files and avoid
the prompts.

1. Copy the variables.template.yaml file to variables.yaml and credentials.template.yaml to credentials.yaml.
2. Provide values for each of the variables in variables.yaml and credentials.yaml.
3. Run `apply.sh --ci` to kick off the automation. You will not be prompted for input variables and the automation will start immediately

The `apply.sh` script will generate the credentials.auto.tfvars and terraform.tfvars files from the
values provided in the yaml files. The variables.yaml and terraform.tfvars files can be checked in with the terraform
templates. However, credentials.yaml and credentials.auto.tfvars should be excluded since they contain
sensitive information. Those files should already be included in the .gitignore file.

### Terraform configuration

In situations where you are comfortable working with the terraform directly, you can skip the yaml
configuration files and directly configure the automation with the terraform configuration files.

1. Copy the variables.template.tfvars file and credentials.auto.template.tfvars to variables.tfvars and credentials.auto.tfvars, respectively.
2. Provide values for the different variables in variables.tfvars and credentials.auto.tfvars.
3. Kick off the automation with `apply.sh --ci` or skip the script and run `terragrunt run-all apply --terragrunt-parallelism 1 --terragrunt-non-interactive`

The terraform.tfvars file can be checked in with the terraform templates. However, credentials.auto.tfvars
should be excluded since it contains sensitive information. The credentials.auto.tfvars file should
already be in .gitignore.

## Contents

### Layers

| Name | Layer | Description | Version |
|------|-------|-------------|---------|
| [105-ibm-vpc-openshift](./105-ibm-vpc-openshift) | infrastructure | IBM VPC and public Red Hat OpenShift server | v1.0.0 |
| [200-openshift-gitops](./200-openshift-gitops) | software | Provisions OpenShift GitOps (ArgoCD) into an existing cluster and bootstraps it to a gitops repository | v1.0.1 |
| [210-ibm-odf-storage](./210-ibm-odf-storage) | infrastructure | Installs OpenShift Data Foundation in an IBM cluster | v1.0.0 |
| [220-dev-tools](./220-dev-tools) | software | Provisions development tools in an OpenShift cluster | v1.0.0 |
| [300-cloud-pak-for-data-foundation](./300-cloud-pak-for-data-foundation) | software | GitOps deployment of Data Foundation for Cloud pak for Data | v1.0.0 |

### Variables

| Name | Description | Sensitive | Default value |
|------|-------------|-----------|---------------|
| cluster_ingress | The ingress subdomain for the cluster |  |  |
| config_banner_text | The text that will appear in the top banner in the cluster |  |  |
| entitlement_key | The Cloud Pak entitlement key |  |  |
| gitops_repo_repo | The short name of the repository (i.e. the part after the org/group name) |  |  |
| ibmcloud_api_key | The api key used to access IBM Cloud | true |  |
| region |  |  |  |
| resource_group_name | The name of the resource group |  |  |
| cloud_pak_deployer_namespace | The value that should be used for the namespace |  | cloud-pak-deployer |
| cluster_flavor | The machine type that will be provisioned for classic infrastructure |  | bx2.16x64 |
| cluster_name | The name of the cluster that will be created within the resource group |  |  |
| cluster_subnets__count | The number of subnets that should be provisioned |  | 3 |
| common_tags | Common tags that should be added to the instance |  |  |
| cpd_instance_namespace | The value that should be used for the namespace |  | cpd-instance |
| cpd_version | The CP4D version to deploy. |  | 4.6.0 |
| deployer_storage_class | Storage class to be used by the cloud pak deployer |  | ocs-storagecluster-cephfs |
| gitops_repo_host | The host for the git repository. The git host used can be a GitHub, GitHub Enterprise, Gitlab, Bitbucket, Gitea or Azure DevOps server. If the host is null assumes in-cluster Gitea instance will be used. |  |  |
| gitops_repo_org | The org/group where the git repository exists/will be provisioned. If the value is left blank then the username org will be used. |  |  |
| gitops_repo_project | The project that will be used for the git repo. (Primarily used for Azure DevOps repos) |  |  |
| gitops_repo_token | The personal access token used to access the repository | true |  |
| gitops_repo_username | The username of the user with access to the repository |  |  |
| install_analyticsengine | Install Analytics Engine cartridge |  | false |
| install_bigsql | Install bigsql cartridge |  | false |
| install_ca | Install ca cartridge |  | false |
| install_cde | Install cde cartridge |  | false |
| install_datagate | Install datagate cartridge |  | false |
| install_datastage-ent-plus | Install datastage-ent-plus cartridge |  | false |
| install_db2 | Install db2 cartridge |  | false |
| install_db2u | Install db2u cartridge |  | false |
| install_db2wh | Install db2wh cartridge |  | false |
| install_dmc | Install dmc cartridge |  | false |
| install_dods | Install dods cartridge |  | false |
| install_dp | Install dp cartridge |  | false |
| install_dv | Install dv cartridge |  | false |
| install_hadoop | Install hadoop cartridge |  | false |
| install_mdm | Install mdm cartridge |  | false |
| install_openpages | Install openpages cartridge |  | false |
| install_planning-analytics | Install planning-analytics cartridge |  | false |
| install_rstudio | Install rstudio cartridge |  | false |
| install_scheduler | Install scheduler cartridge |  | false |
| install_spss | Install spss cartridge |  | false |
| install_voice-gateway | Install voice-gateway cartridge |  | false |
| install_watson-assistant | Install watson-assistant cartridge |  | false |
| install_watson-discovery | Install watson-discovery cartridge |  | false |
| install_watson-ks | Install watson-ks cartridge |  | false |
| install_watson-openscale | Install watson-openscale cartridge |  | false |
| install_watson-speech | Install watson-speech cartridge |  | false |
| install_wkc | Install wkc cartridge |  | false |
| install_wml | Install wml cartridge |  | false |
| install_wml-accelerator | Install wml-accelerator cartridge |  | false |
| install_wsl | Install wsl cartridge |  | false |
| name_prefix | The prefix name for the service. If not provided it will default to the resource group name |  |  |
| worker_count | The number of worker nodes that should be provisioned for classic infrastructure |  | 1 |

## Troubleshooting

