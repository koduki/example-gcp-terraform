provider "google" {

}

module "root" {
  source = "../../modules/root_folders"
  org_id = var.org_id
}


#
# Common Projects
#

module "prj_cmn_terraform_all" {
  source = "../../modules/cmn/terraform"

  postfix         = "xxx1"
  env             = "all"
  billing_account = var.billing_account

  cmn          = module.root.cmn
  default_apis = var.prj_default_apis

  depends_on = [
    module.root
  ]
}

module "prj_cmn_sharedvpc_dev" {
  source = "../../modules/cmn/sharedvpc"

  postfix         = "xxx1"
  env             = "dev"
  billing_account = var.billing_account

  cmn          = module.root.cmn
  default_apis = var.prj_default_apis

  depends_on = [
    module.root
  ]
}

module "prj_cmn_sharedvpc_prd" {
  source = "../../modules/cmn/sharedvpc"

  postfix         = "xxx1"
  env             = "prd"
  billing_account = var.billing_account

  cmn          = module.root.cmn
  default_apis = var.prj_default_apis

  depends_on = [
    module.root
  ]
}

#
# Service Projects
#
module "prj_svc_simpleweb_dir" {
  source = "../../modules/svc/simpleweb_dir"

  svc = module.root.svc

  depends_on = [
    module.root
  ]
}

module "prj_svc_simpleweb_dev" {
  source = "../../modules/svc/simpleweb_prj"

  postfix         = "xxx1"
  env             = "dev"
  billing_account = var.billing_account

  folder_id    = module.prj_svc_simpleweb_dir.name
  default_apis = var.prj_default_apis

  depends_on = [
    module.prj_svc_simpleweb_dir,
    module.prj_cmn_sharedvpc_dev
  ]
}

module "prj_svc_simpleweb_prd" {
  source = "../../modules/svc/simpleweb_prj"

  postfix         = "xxx1"
  env             = "prd"
  billing_account = var.billing_account

  folder_id    = module.prj_svc_simpleweb_dir.name
  default_apis = var.prj_default_apis

  depends_on = [
    module.prj_svc_simpleweb_dir,
    module.prj_cmn_sharedvpc_dev
  ]
}
