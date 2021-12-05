locals {
  subnet_name_front   = format("subnet-svc-default-front-%s", replace(var.region, "-", ""))
  subnet_name_backend = format("subnet-svc-default-backend-%s", replace(var.region, "-", ""))
}

module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 3.0"

  project_id   = var.prj_id
  network_name = "vpc-svc-default"

  subnets = [
    {
      subnet_name      = local.subnet_name_front
      subnet_ip        = var.subnet_ip_front
      subnet_region    = var.region
      subnet_flow_logs = "true"
      description      = "This is common subnet for frontend"
    },
    {
      subnet_name      = local.subnet_name_backend
      subnet_ip        = var.subnet_ip_backend
      subnet_region    = var.region
      subnet_flow_logs = "false"
      description      = "This is common subnet for backend"
    }
  ]
}

resource "google_compute_shared_vpc_host_project" "host" {
  project = var.prj_id
}
