# Kubernetes Helm Charts

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![Release Charts](https://github.com/frittenlab/helm-charts/actions/workflows/release.yml/badge.svg?branch=main)](https://github.com/frittenlab/helm-charts/actions/workflows/release.yml)

This functionality is in beta and is subject to change. The code is provided as-is with no warranties

## Usage

[Helm](https://helm.sh) must be installed to use the charts.
Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

If you had already added this repo earlier, run `helm repo update` to retrieve the latest versions of the packages.

Once Helm is set up properly, add the repo as follows:

```console
helm repo add frittenlab https://frittenlab.github.io/helm-charts
```

You can then run

```console
helm search repo frittenlab
```

to see the charts.

## Install

To install the grafana-dashboards chart:

```console
helm install grafana-dashboards frittenlab/grafana-dashboards
```

To uninstall the chart:

```console
helm delete grafana-dashboards
```

[Apache 2.0 License](https://github.com/frittenlab/helm-charts/blob/main/LICENSE).
