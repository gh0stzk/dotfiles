#!/usr/bin/env bash

TEMP="$(cat /sys/devices/platform/coretemp.*/hwmon/hwmon*/temp2_input | awk '{sub(/000$/, "°C", $0); print}')"
echo "${TEMP:-null}"
