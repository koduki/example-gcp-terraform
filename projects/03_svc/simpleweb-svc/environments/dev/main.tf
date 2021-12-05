locals {
  extra_apis = [
    "bigquery.googleapis.com",
    "dlp.googleapis.com"
  ]
  subnet_front = "projects/${var.sharedvpc_project}/regions/${var.sharedvpc_region}/subnetworks/${var.sharedvpc_front}"
}

resource "google_project_service" "apis" {
  project                    = var.prj_id
  disable_dependent_services = true

  for_each = toset(local.extra_apis)
  service  = each.value
}

resource "google_compute_shared_vpc_service_project" "vpc" {
  host_project    = var.sharedvpc_project
  service_project = var.prj_id
}

module "web_server" {
  source = "../../modules/web_server"

  prj_id = var.prj_id
  env    = var.env
  zone   = var.zone
  subnet = local.subnet_front

  depends_on = [
    google_compute_shared_vpc_service_project.vpc
  ]
}

module "lb-http" {
  source = "../../modules/lb-http"

  prj_id           = var.prj_id
  env              = var.env
  vpc_host_project = var.sharedvpc_project
  vpc_network      = var.sharedvpc_name

  service_port      = 80
  service_port_name = "port-http-${var.env}"
  backend_mig       = module.web_server.mig.id

  depends_on = [
    module.web_server
  ]
}
