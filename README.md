[![CircleCI](https://circleci.com/gh/giantswarm/cluster-api-provider-cloud-director-app.svg?style=shield)](https://circleci.com/gh/giantswarm/cluster-api-provider-cloud-director-app)

# cluster-api-provider-cloud-director-app

## Source

The image is currently built manually from a specific commit since the only release is outdated and `main` is the development branch. The capvcd helm chart is based on the output of `kustomize build` in the following folder:

* Repo: https://github.com/vmware/cluster-api-provider-cloud-director/tree/main/config/default
* Commit: `e6a551d2e142ab67957670ba9c77fa9976486636`

This build removes the CSI, CPI and default class from cloud-init which we will install with our own [cloud-provider-cloud-director](https://github.com/giantswarm/cloud-provider-cloud-director-app) app.

## How to use

There are no credentials in the CAPVCD controller. The credentials are stored in a secret in a namespace that is referenced in the cluster chart.

* Install cluster API v1.1.5.

`clusterctl init --core cluster-api:v1.1.5 -b kubeadm:v1.1.5 -c kubeadm:v1.1.5`

* Install the chart with the values file.
