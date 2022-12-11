scope_project_id      = "udesh-demobox"
monitoring_project_id = ["sample-test-udesh"]
email_address         = "fake_email@blahblah.com"

alerting_policy = {
  "VM Instance - Memory is above 85%" = {
    auto_close         = "3"
    condition_name     = "VM Instance - Memory is above 85%"
    filter             = "resource.type = \"gce_instance\" AND metric.type = \"compute.googleapis.com/instance/uptime\""
    duration           = "300s"
    comparison         = "COMPARISON_GT"
    threshold_value    = "0.85"
    count              = "1"
    alignment_period   = "300s"
    per_series_aligner = "ALIGN_MEAN"
  },
  "VM Instance Uptime" = {
    auto_close         = "3"
    condition_name     = "VM Instance - Memory is above 85%"
    filter             = "resource.type = \"gce_instance\" AND metric.type = \"compute.googleapis.com/instance/memory/balloon/ram_used\""
    duration           = "120s"
    comparison         = "COMPARISON_GT"
    threshold_value    = "0.85"
    count              = "1"
    alignment_period   = "300s"
    per_series_aligner = "ALIGN_PERCENT_CHANGE"
  },
  "Workflow Runs Failed" = {
    auto_close         = "3"
    condition_name     = "Cloud Composer Workflow - Workflow Runs"
    filter             = "resource.type = \"cloud_composer_workflow\" AND metric.type = \"composer.googleapis.com/workflow/run_count\" AND metric.labels.state = \"failed\""
    duration           = "0s"
    comparison         = "COMPARISON_GT"
    threshold_value    = "0.85"
    count              = "1"
    alignment_period   = "21600s"
    per_series_aligner = "ALIGN_COUNT"
  },
  "Cloud SQL Database - Disk utilization" = {
    auto_close         = "7"
    condition_name     = "Cloud SQL Database - Disk utilization"
    filter             = "resource.type = \"cloudsql_database\" AND metric.type = \"cloudsql.googleapis.com/database/disk/utilization\""
    duration           = "0s"
    comparison         = "COMPARISON_GT"
    threshold_value    = "80"
    count              = "1"
    alignment_period   = "300s"
    per_series_aligner = "ALIGN_MEAN"
  },
# ------------------------------------------------------
# | Can be used once optional variables are rolled out |
# ------------------------------------------------------
  "CPU Usage is above 80%" = {
    auto_close           = "3"
    condition_name       = "VM Instance - CPU usage for laz-lob-lam-rnd-aiapp-0864 [MAX]"
    filter               = "resource.type = \"gce_instance\" AND metric.type = \"compute.googleapis.com/instance/cpu/usage_time\""
    duration             = "300s"
    comparison           = "COMPARISON_GT"
    threshold_value      = "80"
    percent              = "80"
    alignment_period     = "300s"
    per_series_aligner   = "ALIGN_MEAN"
    cross_series_reducer = "REDUCE_MAX"
  } 
}