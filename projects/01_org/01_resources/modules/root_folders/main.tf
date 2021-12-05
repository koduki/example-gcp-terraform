resource "google_folder" "cmn" {
    display_name = "cmn"
    parent       = var.org_id
}

resource "google_folder" "svc" {
    display_name = "svc"
    parent       = var.org_id
}