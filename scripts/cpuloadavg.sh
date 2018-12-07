#!/bin/sh

load=$(awk '{print $1}' < /proc/loadavg)
echo -n $load
