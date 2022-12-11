variable "scope_project_id" {
  type = string
}
variable "monitoring_project_id" {
  type = list(string)
}
variable "email_address" {
  type = string
}
variable "alerting_policy" {
  type = map(object({
    auto_close           = number,
    condition_name       = string,
    filter               = string,
    duration             = string,
    comparison           = string,
    threshold_value      = string,
    count                = optional(string),
    percent              = optional(string), #Currently in beta, can be used once rolled out 
    alignment_period     = string,
    per_series_aligner   = string,
    cross_series_reducer = optional(string)
  }))
}