#!/bin/bash

# Define the deployment strategy (e.g., add, rollback, start, gracefulrestart, restart, stop)
deployment_strategy=$1

# Map the deployment strategy to the corresponding playbook
case $deployment_strategy in
  "add")
    playbook="add.yml"
    ;;
  "rollback")
    playbook="rollback.yml"
    ;;
  "start")
    playbook="start.yml"
    ;;
  "gracefulrestart")
    playbook="gracefulrestart.yml"
    ;;
  "restart")
    playbook="restart.yml"
    ;;
  "stop")
    playbook="stop.yml"
    ;;
  *)
    echo "Unknown deployment strategy: $deployment_strategy"
    exit 1
    ;;
esac
