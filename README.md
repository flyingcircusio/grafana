# Grafana Dashboard Provisions

## How to export a new Dashboard for use in this repo:

Export your dashboard to JSON by following these steps:

0. Create your dashboard
1. In the top right corner of your screen select the `Share` button (colored blue at the time of this writing)
2. Navigate to `Export` but do *not* tick `Export for sharing externally`
3. View the dashboard as JSON by selecting `View JSON`, then copy it to your clipboard
5. Open a new file in this repository and paste in the JSON from the previous step

Make sure to install the pre-commit hook and/or run the cleanup script to prepare your dashboard
for provisioning.

```
./sanitize-dashboards.sh my-new-dashboard.json
```

Finally, commit your changes, push to a new branch and open a pull request against the master branch.
