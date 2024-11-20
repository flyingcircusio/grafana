# Grafana Dashboard Provisions

## How to export a new Dashboard for use in this repo:

Export your dashboard to JSON by following these steps:

0. Create your dashboard
1. In the top right corner of your screen select the `Share` button (colored blue at the time of this writing)
2. Navigate to `Export` but do *not* tick `Export for sharing externally`
3. View the dashboard as JSON by selecting `View JSON`, then copy it to your clipboard
5. Open a new file in this repository and paste in the JSON from the previous step

Then, run these commands to prepare the dashboard for provisioning:

```sh
DASHBOARD=./my-new-dashboard.json

# Verify that none of the variables from your clipboard contain sensitive information by nulling them
jq '.templating.list.[].current |= {}' $DASHBOARD > tmp.json && mv tmp.json $DASHBOARD

# Make sure that the data sources refer to Grafana's data sources by name, not by uid:
jq '(.. | objects | select(has("uid") and .type == "prometheus")) |= "Prometheus"' $DASHBOARD > tmp.json && mv tmp.json $DASHBOARD
jq '(.. | objects | select(has("uid") and .type == "loki")) |= "Loki"' $DASHBOARD > tmp.json && mv tmp.json $DASHBOARD
```

Finally, commit your changes, push to a new branch and open a pull request against the master branch.
