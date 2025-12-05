# Grafana Dashboard Provisions

## Vendored Dashboards

This repository contains several third-party dashboards as vendored files. For attribution and licensing information, see [COPYING.md](./COPYING.md).

## How to export a new Dashboard for use in this repo:

Export your dashboard to JSON by following these steps:

0. Create your dashboard
1. In the top right corner of your screen select the `Export` -> `Export as JSON` button
    - In case you are updating an existing provisioned dashboard, just click on `Save dashboard`. Grafana will open a dialogue that this is a *Provisioned dashboard* and offer you to export it instead.
    - Do *not* `Save as copy`, as this could modify dashboard parameters (UUID, title, …) in unintended ways.
2. Do *not* tick `Export for sharing externally`
3. You now see the dashboard as JSON. Save the dashboard via `Download file` to a (new) file in this repository.

Make sure to install the pre-commit hook and/or run the cleanup script to prepare your dashboard
for provisioning.

```
./sanitize-dashboards.sh my-new-dashboard.json
```

Finally, commit your changes, push to a new branch and open a pull request against the master branch.
