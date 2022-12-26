#!/bin/bash

set -euo pipefail

REPO_NAME="cluster-api-provider-cloud-director"

cd "$(dirname "${0}")"
UPSTREAM_ORG="${1}"
COMMIT_TO_SYNC="${2}"

# create a temporary directory and checkout CAPVCD there
TMPDIR=$(mktemp -d)
pushd "${TMPDIR}"

git clone "https://github.com/${UPSTREAM_ORG}/${REPO_NAME}.git"
pushd "${REPO_NAME}"

git checkout -d "${COMMIT_TO_SYNC}"
rm ./tools/*
# install required binaries
make kustomize controller-gen conversion

make release-manifests

# build and push a corresponding image
make docker-build
docker tag harbor-repo.vmware.com/vcloud/cluster-api-provider-cloud-director:main-branch quay.io/giantswarm/cluster-api-provider-cloud-director-vcd:${COMMIT_TO_SYNC}
docker push quay.io/giantswarm/cluster-api-provider-cloud-director-vcd:${COMMIT_TO_SYNC}

# remote cluster-api-provider-cloud-director from the stack
popd

# remote $TMPDIR from the stack
popd

# copy upstream generated release-manifests into origin
cp -v "${TMPDIR}/${REPO_NAME}/templates/infrastructure-components.yaml" "../config/kustomize/input/"
