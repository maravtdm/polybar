#! /bin/bash
light=$(light | cut -d. -f1)
echo -n $light
