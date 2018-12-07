#!/bin/sh
proc=$(ps -Ao pcpu,comm --sort=-pcpu --no-headers | head -n 1)
echo $proc
