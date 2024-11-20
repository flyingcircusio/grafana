#!/usr/bin/env bash

# This script accepts any number of dashboards files in json format to be sanitized
# it will iterate over them one by one and fix some common issues 
#
# If not provided with any files as arguments it defaults to all json files on the root level

DASHBOARDS=${@:-*.json}

set -eu pipefail

for DASHBOARD in $DASHBOARDS; do
    # used for temporary outputs from jq here since jq does not support editing in-place
    # an alternative way would be piping into sponge from moreutils which essentially does the same
    tmpfile=$(mktemp)

    # Verify that none of the variables from your dashboard contain sensitive information by nulling them
    jq '.templating.list.[].current |= {}' "$DASHBOARD" > $tmpfile
    mv $tmpfile "$DASHBOARD"

    ## Make sure that the data sources refer to Grafana's data sources by name, not by uid:
    jq '(.. | objects | select(has("uid") and .type == "prometheus")) |= "Prometheus"' "$DASHBOARD" > $tmpfile 
    mv $tmpfile "$DASHBOARD"
    jq '(.. | objects | select(has("uid") and .type == "loki")) |= "Loki"' "$DASHBOARD" > $tmpfile
    mv $tmpfile "$DASHBOARD"
done
