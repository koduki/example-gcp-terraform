locals {
  extra_apis = [
    "cloudbuild.googleapis.com",
    "networkmanagement.googleapis.com",
    "cloudresourcemanager.googleapis.com"
  ]
}

resource "google_project_service" "apis" {
  project                    = var.prj_id
  disable_dependent_services = true

  for_each = toset(local.extra_apis)
  service  = each.value
}

resource "google_storage_bucket" "terraform-state" {
  project       = var.prj_id
  name          = "tfstate-${var.prj_id}"
  location      = "US"
  force_destroy = true

  versioning {
    enabled = true
  }
  uniform_bucket_level_access = true
}

module "trigger-all-review" {
  source = "../../modules/build-trigger"

  prj_id       = var.prj_id
  trigger_name = "gcp-terraform-all-review"
  trigger_desc = "Terraform Plan Review for all environment"
  tags         = ["all", "preview"]

  owner  = var.github_owner
  name   = var.github_repo
  branch = "^env/all_review$"

  svc_account_name = var.svc_account_name
}

module "trigger-all-deploy" {
  source = "../../modules/build-trigger"

  prj_id       = var.prj_id
  trigger_name = "gcp-terraform-all-deploy"
  trigger_desc = "Terraform Deployment for all environment"
  tags         = ["all", "deploy"]

  owner  = var.github_owner
  name   = var.github_repo
  branch = "^env/all$"

  svc_account_name = var.svc_account_name
}

module "trigger-prd-review" {
  source = "../../modules/build-trigger"

  prj_id       = var.prj_id
  trigger_name = "gcp-terraform-prd-review"
  trigger_desc = "Terraform Plan Review for production environment"
  tags         = ["prd", "preview"]

  owner  = var.github_owner
  name   = var.github_repo
  branch = "^env/prd_review$"

  svc_account_name = var.svc_account_name
}

module "trigger-prd-deploy" {
  source = "../../modules/build-trigger"

  prj_id       = var.prj_id
  trigger_name = "gcp-terraform-prd-deploy"
  trigger_desc = "Terraform Deployment for production environment"
  tags         = ["prd", "deploy"]

  owner  = var.github_owner
  name   = var.github_repo
  branch = "^env/prd$"

  svc_account_name = var.svc_account_name
}

module "trigger-dev-deploy" {
  source = "../../modules/build-trigger"

  prj_id       = var.prj_id
  trigger_name = "gcp-terraform-dev-deploy"
  trigger_desc = "Terraform Deployment for development environment"
  tags         = ["dev", "deploy"]

  owner  = var.github_owner
  name   = var.github_repo
  branch = "^env/dev$"

  svc_account_name = var.svc_account_name
}
