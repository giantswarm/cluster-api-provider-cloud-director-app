[![CircleCI](https://circleci.com/gh/giantswarm/cluster-api-provider-cloud-director-app.svg?style=shield)](https://circleci.com/gh/giantswarm/cluster-api-provider-cloud-director-app)

# cluster-api-provider-cloud-director-app

## Source

The image is currently built manually from a specific commit since the only release is outdated and `main` is the development branch. The capvcd helm chart is based on the output of `kustomize build` in the following folder:

* Repo: https://github.com/vmware/cluster-api-provider-cloud-director/tree/main/config/default
* Commit: `22af653e351f3e788774fa6000658710b3415706`

### update to a newer CAPVCD release

1. edit the value of `UPSTREAM_ORG` and `COMMIT_TO_SYNC` in [the Makefile](Makefile.custom.mk) to the desired CAPVCD version
2. run `make all`

## How to use

There are no credentials in the CAPVCD controller. The credentials are stored in a secret in a namespace that is referenced in the cluster chart.

Set `skipRDE: true` if the [VCD API schema extension](https://github.com/vmware/cluster-api-provider-cloud-director/blob/main/docs/VCD_SETUP.md#register-cluster-api-schema) wasn't registered by the cloud provider.

* Install cluster API v1.1.5.

`clusterctl init --core cluster-api:v1.1.5 -b kubeadm:v1.1.5 -c kubeadm:v1.1.5`

* Install the chart with the values file.
