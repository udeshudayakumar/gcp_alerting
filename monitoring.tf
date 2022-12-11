resource "google_monitoring_monitored_project" "primary" {
  for_each      = toset(var.monitoring_project_id)
  metrics_scope = var.scope_project_id
  name          = each.value
}