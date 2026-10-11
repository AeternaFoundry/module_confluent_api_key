resource "confluent_api_key" "api_keys" {
  for_each = var.api_keys

  description            = each.value.description
  disable_wait_for_ready = each.value.disable_wait_for_ready
  display_name           = each.value.display_name

  owner {
    api_version = each.value.owner.api_version
    id          = each.value.owner.id
    kind        = each.value.owner.kind
  }

  dynamic "managed_resource" {
    for_each = each.value.managed_resource != null ? [each.value.managed_resource] : []
    content {
      api_version = managed_resource.value.api_version
      dynamic "environment" {
        for_each = managed_resource.value.environment != null ? managed_resource.value.environment : []
        content {
          id = environment.value.id
        }
      }
      id   = managed_resource.value.id
      kind = managed_resource.value.kind
    }
  }
}

