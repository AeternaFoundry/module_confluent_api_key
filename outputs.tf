output "api_keys_id" {
  description = "Map of id values across all api_keys, keyed the same as var.api_keys except keys with no id are omitted"
  value       = { for k, v in confluent_api_key.api_keys : k => v.id if v.id != null && length(v.id) > 0 }
}
output "api_keys_description" {
  description = "Map of description values across all api_keys, keyed the same as var.api_keys except keys with no description are omitted"
  value       = { for k, v in confluent_api_key.api_keys : k => v.description if v.description != null && length(v.description) > 0 }
}
output "api_keys_disable_wait_for_ready" {
  description = "Map of disable_wait_for_ready values across all api_keys, keyed the same as var.api_keys except keys with no disable_wait_for_ready are omitted"
  value       = { for k, v in confluent_api_key.api_keys : k => v.disable_wait_for_ready if v.disable_wait_for_ready != null }
}
output "api_keys_display_name" {
  description = "Map of display_name values across all api_keys, keyed the same as var.api_keys except keys with no display_name are omitted"
  value       = { for k, v in confluent_api_key.api_keys : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "api_keys_managed_resource" {
  description = "Map of managed_resource values across all api_keys, keyed the same as var.api_keys except keys with no managed_resource are omitted"
  value       = { for k, v in confluent_api_key.api_keys : k => one(v.managed_resource) if v.managed_resource != null && length(v.managed_resource) > 0 }
}
output "api_keys_owner" {
  description = "Map of owner values across all api_keys, keyed the same as var.api_keys except keys with no owner are omitted"
  value       = { for k, v in confluent_api_key.api_keys : k => one(v.owner) if v.owner != null && length(v.owner) > 0 }
}
output "api_keys_secret" {
  description = "Map of secret values across all api_keys, keyed the same as var.api_keys except keys with no secret are omitted"
  value       = { for k, v in confluent_api_key.api_keys : k => v.secret if v.secret != null && length(v.secret) > 0 }
  sensitive   = true
}

