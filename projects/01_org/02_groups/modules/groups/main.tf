resource "google_cloud_identity_group" "my-groups" {
  parent = var.parent_id
  group_key {
    id = var.group_key
  }
  labels = {
    "cloudidentity.googleapis.com/groups.discussion_forum" = ""
  }

  display_name = var.display_name
  description  = var.description
}
