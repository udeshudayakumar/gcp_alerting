variable "project_id" {
  type = string
}
variable "email_address" {
  type = string
}
variable "alerting_policy" {
  type = map(object({
    auto_close           = string,
    condition_name       = string,
    filter               = string,
    duration             = string,
    comparison           = string,
    threshold_value      = string,
    count                = string,
    # percent              = optional(string),
    alignment_period     = string,
    per_series_aligner   = string,
    # cross_series_reducer = optional(string)
  }))
}