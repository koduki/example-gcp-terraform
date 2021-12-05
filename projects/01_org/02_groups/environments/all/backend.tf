terraform {
  backend "gcs" {
    bucket = "tfstate-terraform-cmn-all-xxx1"
    prefix = "env/org/groups"
  }
}
