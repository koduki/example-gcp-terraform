variable "org_rolesets" {
  default = {
    "nwadmin" : [
      "roles/compute.xpnAdmin",
      "roles/compute.securityAdmin",
      "roles/vpcaccess.admin",
      "roles/accesscontextmanager.policyAdmin",
    ],
    "terraform-builder-extra" : [
      "roles/resourcemanager.projectCreator",
      "roles/resourcemanager.projectDeleter",
      "roles/resourcemanager.projectMover",
      "roles/cloudbuild.builds.editor",      
      "roles/billing.admin",
      "roles/compute.admin",
      "roles/orgpolicy.policyAdmin",
      "roles/vpcaccess.admin",
      "roles/accesscontextmanager.policyAdmin",
      "roles/secretmanager.secretAccessor"
    ]
  }
}

variable "prj_rolesets" {
  default = {
    "nwadmin" : [
      "roles/compute.xpnAdmin",
      "roles/compute.securityAdmin",
      "roles/vpcaccess.admin",
      "roles/accesscontextmanager.policyAdmin",
    ],
    "prjadmin" : [
      "roles/compute.admin",
      "roles/storage.admin"
    ],
    "user" : [
      "roles/compute.admin"
    ]
  }
}