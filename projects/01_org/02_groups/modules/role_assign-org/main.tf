resource "google_organization_iam_member" "my-role_assign" {
  org_id = var.org_id
  member = var.member

  count = length(var.rolesets[var.roleset])
  role  = element(var.rolesets[var.roleset], count.index)
}
