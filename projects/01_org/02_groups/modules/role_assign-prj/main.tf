resource "google_project_iam_member" "my-role_assign" {
  project = var.prj_id
  member = var.member

  count = length(var.rolesets[var.roleset])
  role  = element(var.rolesets[var.roleset], count.index)
}
