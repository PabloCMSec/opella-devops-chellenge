locals {
  default_tags = {
    managed_by = "terraform"
  }

  all_tags = merge(local.default_tags, var.tags)
}
