variable "group_list" {
  default = {
    "gcp-cmn-nw-admins@nklab.dev" : { "name" : "gcp-cmn-nw-admins", "description" : "Network Administrator" },
    "gcp-cmn-developers@nklab.dev" : { "name" : "gcp-cmn-developers", "description" : "Network Developer" },
    "gcp-svc-simpleweb-dev-admins@nklab.dev" : { "name" : "gcp-svc-simpleweb-dev-admins", "description" : "Simple Web Administrator on Dev" },
    "gcp-svc-simpleweb-dev-developers@nklab.dev" : { "name" : "gcp-svc-simpleweb-dev-developers", "description" : "Simple Web Administrator on Dev" },
    "gcp-svc-simpleweb-prd-admins@nklab.dev" : { "name" : "gcp-svc-simpleweb-prd-admins", "description" : "Simple Web Administrator on Production" },
    "gcp-svc-simpleweb-prd-developers@nklab.dev" : { "name" : "gcp-svc-simpleweb-prd-developers", "description" : "Simple Web Administrator on Production" },
  }
}

variable "assign_policy4org" {
  default = {
    "group:gcp-cmn-nw-admins@nklab.dev"                                                   = "nwadmin",
    "serviceAccount:svc-terraform-builder@terraform-cmn-all-xxx1.iam.gserviceaccount.com" = "terraform-builder-extra"
  }
}

variable "assign_policy4sharedvpc_dev" {
  default = {
    "group:gcp-cmn-nw-admins@nklab.dev"  = "prjadmin",
    "group:gcp-cmn-developers@nklab.dev" = "user",
  }
}

variable "assign_policy4sharedvpc_prd" {
  default = {
    "group:gcp-cmn-nw-admins@nklab.dev"  = "prjadmin",
    "group:gcp-cmn-developers@nklab.dev" = "user",
  }
}

variable "assign_policy4simpleweb_dev" {
  default = {
    "group:gcp-svc-simpleweb-dev-admins@nklab.dev"     = "prjadmin",
    "group:gcp-svc-simpleweb-dev-developers@nklab.dev" = "user",
  }
}

variable "assign_policy4simpleweb_prd" {
  default = {
    "group:gcp-svc-simpleweb-prd-admins@nklab.dev"     = "prjadmin",
    "group:gcp-svc-simpleweb-prd-developers@nklab.dev" = "user",
  }
}
