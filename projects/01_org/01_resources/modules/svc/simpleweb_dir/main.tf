resource "google_folder" "service" {
  display_name = "simple-web"
  parent       = var.svc
}
