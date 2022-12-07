resource "google_monitoring_alert_policy" "alert_policy" {
  for_each     = var.alerting_policy
  display_name = each.key
  combiner     = "OR"
  alert_strategy {
    auto_close = "${each.value.auto_close*86400}s"
  }
  conditions {
    display_name = each.value.condition_name
    condition_threshold {
      filter          = each.value.filter
      duration        = each.value.duration
      comparison      = each.value.comparison
      threshold_value = each.value.threshold_value
      trigger {
        count   = each.value.count
        percent = each.value.percent
      }
      aggregations {
        alignment_period     = each.value.alignment_period
        per_series_aligner   = each.value.per_series_aligner
        cross_series_reducer = each.value.cross_series_reducer
      }
    }
  }
  notification_channels = [google_monitoring_notification_channel.basic.id]
}

#Can be removed after optional variable feature rolls out
resource "google_monitoring_alert_policy" "other_alert_policy" {
  display_name = "CPU Usage is above 80%"
  combiner     = "OR"
  alert_strategy {
    auto_close = "259200s"
  }
  conditions {
    display_name = "VM Instance - CPU usage"
    condition_threshold {
      filter          = "resource.type = \"gce_instance\" AND metric.type = \"compute.googleapis.com/instance/cpu/usage_time\""
      duration        = "300s"
      comparison      = "COMPARISON_GT"
      threshold_value = "80"
      trigger {
        percent = "80"
      }
      aggregations {
        alignment_period     = "300s"
        per_series_aligner   = "ALIGN_MEAN"
        cross_series_reducer = "REDUCE_MAX"
      }
    }
  }
  notification_channels = [google_monitoring_notification_channel.basic.id]
}