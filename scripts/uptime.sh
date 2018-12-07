#!/bin/sh

uptime=$(uptime --pretty | sed 's/up //' | sed 's/\ years\?,/a/' | sed 's/\ days\?,/j/' | sed 's/\ hours\?,\?/h/' | sed 's/\ minutes\?/m/')
echo -n $uptime
