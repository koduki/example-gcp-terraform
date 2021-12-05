output "network" {
  value = module.vpc.network_name
}

output "subnet_name_front" {
  value = local.subnet_name_front
}

output "subnet_name_backend" {
  value = local.subnet_name_backend
}
