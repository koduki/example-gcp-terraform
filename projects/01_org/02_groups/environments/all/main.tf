module "groups" {
  for_each = var.group_list

  source       = "../../modules/groups"
  parent_id    = var.parent_id
  group_key    = each.key
  display_name = each.value.name
  description  = each.value.description
}

module "role_assign-terraform-base" {
  source  = "../../modules/role_assign-terraform"

  org_id = var.org_id
  member = var.svc_terraform_builder
}

module "role_assign-org" {
  for_each = var.assign_policy4org

  source  = "../../modules/role_assign-org"
  org_id  = var.org_id
  member  = each.key
  roleset = each.value
  rolesets = var.org_rolesets

  depends_on = [
    module.groups
  ]
}

module "role_assign-policy4sharedvpc_dev" {
  for_each = var.assign_policy4sharedvpc_dev

  source  = "../../modules/role_assign-prj"
  prj_id  = "sharedvpc-cmn-dev-xxx1"
  member  = each.key
  roleset = each.value
  rolesets = var.prj_rolesets

  depends_on = [
    module.groups
  ]
}

module "role_assign-policy4sharedvpc_prd" {
  for_each = var.assign_policy4sharedvpc_prd

  source  = "../../modules/role_assign-prj"
  prj_id  = "sharedvpc-cmn-prd-xxx1"
  member  = each.key
  roleset = each.value
  rolesets = var.prj_rolesets

  depends_on = [
    module.groups
  ]
}

module "role_assign-policy4simpleweb_dev" {
  for_each = var.assign_policy4simpleweb_dev

  source  = "../../modules/role_assign-prj"
  prj_id  = "simpleweb-svc-dev-xxx1"
  member  = each.key
  roleset = each.value
  rolesets = var.prj_rolesets

  depends_on = [
    module.groups
  ]
}

module "role_assign-policy4simpleweb_prd" {
  for_each = var.assign_policy4simpleweb_prd

  source  = "../../modules/role_assign-prj"
  prj_id  = "simpleweb-svc-prd-xxx1"
  member  = each.key
  roleset = each.value
  rolesets = var.prj_rolesets

  depends_on = [
    module.groups
  ]
}