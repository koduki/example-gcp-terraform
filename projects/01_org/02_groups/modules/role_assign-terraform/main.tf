resource "google_organization_iam_member" "role_assign-serviceAccountAdmin" {
  org_id = var.org_id
  member = var.member

  role = "roles/iam.serviceAccountAdmin"
}

resource "google_organization_iam_member" "role_assign-organizationRoleAdmin" {
  org_id = var.org_id
  member = var.member

  role = "roles/iam.organizationRoleAdmin"
}

resource "google_organization_iam_member" "role_assign-organizationAdmin" {
  org_id = var.org_id
  member = var.member

  role = "roles/resourcemanager.organizationAdmin"
}

resource "google_organization_iam_member" "role_assign-folderAdmin" {
  org_id = var.org_id
  member = var.member

  role = "roles/resourcemanager.folderAdmin"
}

resource "google_organization_iam_member" "role_assign-projectIamAdmin" {
  org_id = var.org_id
  member = var.member

  role = "roles/resourcemanager.projectIamAdmin"
}

resource "google_organization_iam_member" "role_assign-storage" {
  org_id = var.org_id
  member = var.member

  role = "roles/storage.admin"
}

resource "google_organization_iam_member" "role_assign-logWriter" {
  org_id = var.org_id
  member = var.member

  role = "roles/logging.logWriter"
}