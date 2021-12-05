resource "google_cloudbuild_trigger" "trigger-all-review" {
  project     = var.prj_id
  name        = var.trigger_name
  description = var.trigger_desc
  tags        = var.tags

  github {
    owner = var.owner
    name  = var.name
    push {
      branch = var.branch
    }
  }

  service_account = "projects/${var.prj_id}/serviceAccounts/${var.svc_account_name}@${var.prj_id}.iam.gserviceaccount.com"
  filename        = "cloudbuild.yaml"
}
