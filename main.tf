provider "datadog" {
  api_key = "${var.api_key}"
  app_key = "${var.app_key}"

}

resource "datadog_monitor" "CPU_Usage" {
  
  name               = "Test_Terraform_4"
  type               = "metric alert"
  message            = "Monitor triggered. Notify: @havalamit7@gmail.com"
  escalation_message = "Escalation message @havalamit7@gmail.com"

  # query = "avg(last_10m):avg:aws.ec2.cpuutilization{instance_id:${var.instance}} by {host} < 5"
  query = "avg(last_10m):avg:aws.ec2.cpuutilization{Instance_ID:${var.instance_id}} by {host} > 90"
          
 
  thresholds {
    critical = 90
    critical_recovery = 70
    warning = 80
    warning_recovery = 60
  }

  # a full window of data for evaluation.
  require_full_window = true

  # if data is missing.
  notify_no_data    = false

  # automatically resolve this event from a triggered state.
  timeout_h = false

  # For new hosts, wait 300 seconds before evaluating this monitor
  new_host_delay = 300

  # Delay evaluation by 0 seconds
  evaluation_delay = 60


# renotify if the monitor has not been resolved.
   renotify_interval = 0

# tags 
  # tags 

#  alert recipients when this alert is modified
  # notify_audit = "false"

# editing this monitor to its creator or administrators
  # locked = "false"
}