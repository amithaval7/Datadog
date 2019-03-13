provider "datadog" {
  api_key = "4295c759fb2ad28b187cebe3085fd730"
  app_key = "d20f0e7c8302fc0b5c925474f8e9f4ae29650ddf"
  
}

resource "datadog_monitor" "CPU_Usage" {
  name               = "Test_Terraform_4"
  type               = "metric alert"
  message            = "Monitor triggered. Notify: @havalamit7@gmail.com"
  escalation_message = "Escalation message @havalamit7@gmail.com"

  query = "avg(last_10m):avg:aws.ec2.cpuutilization{instance_id:${var.instance}} by {host} < 5"

  thresholds {
    
    critical = 5 
    
  }

  notify_no_data    = false
  renotify_interval = 60

  notify_audit = false
  timeout_h    = 60
  include_tags = true

  silenced {
    "*" = 0
  }

  # tags = ["foo:bar", "baz"]
}