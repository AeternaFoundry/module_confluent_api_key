variable "api_keys" {
  description = <<EOT
Map of api_keys, attributes below
Required:
    - owner (block):
        - api_version (required)
        - id (required)
        - kind (required)
Optional:
    - description
    - disable_wait_for_ready
    - display_name
    - managed_resource (block):
        - api_version (required)
        - environment (optional, block):
            - id (required)
        - id (required)
        - kind (required)
EOT

  type = map(object({
    description            = optional(string)
    disable_wait_for_ready = optional(bool)
    display_name           = optional(string)
    owner = object({
      api_version = string
      id          = string
      kind        = string
    })
    managed_resource = optional(object({
      api_version = string
      environment = optional(list(object({
        id = string
      })))
      id   = string
      kind = string
    }))
  }))
  # Note: 9 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

