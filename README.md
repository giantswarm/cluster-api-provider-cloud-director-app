[![CircleCI](https://circleci.com/gh/giantswarm/cluster-api-provider-cloud-director-app.svg?style=shield)](https://circleci.com/gh/giantswarm/cluster-api-provider-cloud-director-app)

# cluster-api-provider-cloud-director-app

## Source

The image is currently built manually from a specific commit since the only release is outdated and `main` is the development branch. The capvcd helm chart is based on the output of `kustomize build` in the following folder:

* Repo: https://github.com/vmware/cluster-api-provider-cloud-director/tree/main/config/default
* Commit: `8a5e8da3676d51f4bbf0ba2900fab96443c8eb96`

This build includes a fix for https://github.com/giantswarm/giantswarm/issues/23085#issuecomment-1209339260. Hardcode the [CPI](https://github.com/vmware/cluster-api-provider-cloud-director/blob/main/controllers/cluster_scripts/cloud_init.tmpl#L123) and [CSI](https://github.com/vmware/cluster-api-provider-cloud-director/blob/main/controllers/cluster_scripts/cloud_init.tmpl#L138) versions in the cloud-init script, otherwise it uses the repos from main for both, which point to an internal VMware repo we don't have access to. This is temporary workaround, future commits will move CPI and CSI to Cluster Resource Sets that we can then ignore in favor of our own `cloud-provider-cloud-director` app.

## How to use

There are no credentials in the CAPVCD controller. The credentials are stored in a secret in a namespace that is referenced in the cluster chart.

* Install cluster API v1.1.5.

`clusterctl init --core cluster-api:v1.1.5 -b kubeadm:v1.1.5 -c kubeadm:v1.1.5`

* Install the chart with the values file.
