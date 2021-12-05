resource "google_project" "prj" {
  name                = format("simpleweb-svc-%s", var.env)
  project_id          = format("simpleweb-svc-%s-%s", var.env, var.postfix)
  folder_id           = var.folder_id
  auto_create_network = false
  billing_account     = var.billing_account
}

resource "google_project_service" "apis" {
  project                    = google_project.prj.project_id
  disable_dependent_services = true

  for_each = toset(var.default_apis)
  service  = each.value

  depends_on = [
    google_project.prj
  ]
}
