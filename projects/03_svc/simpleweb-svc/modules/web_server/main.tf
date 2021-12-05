resource "google_compute_instance" "web_server" {
  project      = var.prj_id
  zone         = var.zone
  name         = "${var.env}-vm-httpd001"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    subnetwork = var.subnet
    # access_config {
    #   // If you need to give the VM an external ip address, please comment out.
    # }
  }

  tags = ["web-server", "allow-ssh", var.env]

  scheduling {
    automatic_restart = false
    preemptible       = true
  }

  metadata_startup_script = "sudo apt-get update\n sudo apt-get install -y apache2 && echo '<html><body><h1>Environment: ${var.subnet}</h1></body></html>' | sudo tee /var/www/html/index.html"

  metadata = {
    enable-oslogin = "TRUE"
  }
}

resource "google_compute_instance_group" "mig_webserver" {
  project = var.prj_id
  zone    = var.zone

  name        = "${var.env}-mig-webservers"
  description = "Web test instance group"

  instances = [
    google_compute_instance.web_server.id,
  ]

  named_port {
    name = "http"
    port = "80"
  }

  depends_on = [
    google_compute_instance.web_server
  ]

}