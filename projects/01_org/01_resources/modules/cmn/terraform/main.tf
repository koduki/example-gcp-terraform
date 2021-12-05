resource "google_project" "prj" {
  name                = format("terraform-cmn-%s", var.env)
  project_id          = format("terraform-cmn-%s-%s", var.env, var.postfix)
  folder_id           = var.cmn
  auto_create_network = false
  billing_account     = var.billing_account
}

resource "google_project_service" "apis" {
  project                    = google_project.prj.project_id
  disable_dependent_services = true

  for_each = toset(var.default_apis)
  service  = each.value
}

resource "google_service_account" "cloudbuild_service_account" {
  project      = google_project.prj.project_id
  account_id   = "svc-terraform-builder"
  display_name = "Terraform Builder"
  description  = "Service account for Terraform Cloud Build"

  depends_on = [
    google_project.prj
  ]
}
