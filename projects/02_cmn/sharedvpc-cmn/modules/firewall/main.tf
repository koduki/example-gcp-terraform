resource "google_compute_firewall" "allow-ssh" {
  project = var.prj_id

  name    = "allow-ssh-from-iap"
  network = var.network
  description = "Allow SSH request via IAP"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  target_tags   = ["allow-ssh"]
  source_ranges = ["35.235.240.0/20"]
}