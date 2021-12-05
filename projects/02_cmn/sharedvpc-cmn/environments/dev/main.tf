locals {
  extra_apis = [
    "networkmanagement.googleapis.com"
  ]
}

resource "google_project_service" "apis" {
  project                    = var.prj_id
  disable_dependent_services = true

  for_each = toset(local.extra_apis)
  service  = each.value
}

module "vpc" {
  source = "../../modules/vpc"
  prj_id = var.prj_id

  region            = "us-west1"
  subnet_ip_front   = "10.0.0.0/16"
  subnet_ip_backend = "10.1.0.0/16"
}

module "firewall" {
  source = "../../modules/firewall"
  prj_id = var.prj_id

  network = module.vpc.network

  depends_on = [
    module.vpc
  ]
}
