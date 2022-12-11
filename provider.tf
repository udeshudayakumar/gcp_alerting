terraform {
  experiments = [module_variable_optional_attrs]
}

provider "google" {
  project = var.scope_project_id
  region  = "us-central1"
}