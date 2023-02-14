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

# see https://github.com/vmware/cluster-api-provider-cloud-director/pull/350
rm ./tools/* || true

# install required binaries
make kustomize controller-gen conversion

make release-manifests

# remote cluster-api-provider-cloud-director from the stack
popd

# remote $TMPDIR from the stack
popd

# copy upstream generated release-manifests into origin
cp -v "${TMPDIR}/${REPO_NAME}/templates/infrastructure-components.yaml" "../config/kustomize/input/"
