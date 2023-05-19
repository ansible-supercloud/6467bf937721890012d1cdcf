skip = true

terraform {
  extra_arguments "reduced_parallelism" {
    commands  = get_terraform_commands_that_need_parallelism()
    arguments = ["-parallelism=6"]
  }

  extra_arguments "common_vars" {
    commands = get_terraform_commands_that_need_vars()

    required_var_files = [
      "${get_parent_terragrunt_dir()}/terraform.tfvars"
    ]
    optional_var_files = [
      "${get_parent_terragrunt_dir()}/credentials.auto.tfvars"
    ]
  }
}
