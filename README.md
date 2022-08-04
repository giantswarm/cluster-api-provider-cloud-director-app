[![CircleCI](https://circleci.com/gh/giantswarm/cluster-api-provider-cloud-director-app.svg?style=shield)](https://circleci.com/gh/giantswarm/cluster-api-provider-cloud-director-app)

# cluster-api-provider-cloud-director-app

## Source

The image is currently built manually from a specific commit since the only release is outdated and `main` is the development branch. The capvcd helm chart is based on the output of `kustomize build` in the following folder:

* Repo: https://github.com/vmware/cluster-api-provider-cloud-director/tree/main/config/default
* Commit: 003336f85f44312252553dc1369faf409e18c10b

## How to use

There are no credentials in the CAPVCD controller. The credentials are stored in a secret in a namespace that is referenced in the cluster chart.

* Install cluster API v1.1.3.

`clusterctl init --core cluster-api:v1.1.3 -b kubeadm:v1.1.3 -c kubeadm:v1.1.3`

__The vipSubnet field has been moved to the VCDCluster CRD in [cluster-cloud-director](https://github.com/vmware/cluster-api-provider-cloud-director).__

* Install the chart with the values file.
