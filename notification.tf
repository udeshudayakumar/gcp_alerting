resource "google_monitoring_notification_channel" "basic" {
  display_name = "Notification Channel"
  type         = "email"
  labels = {
    email_address = var.email_address
  }
  force_delete = false
}