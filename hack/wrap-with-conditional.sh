#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

cd "helm/cluster-api-provider-cloud-director/templates"

for file in *_ciliumnetworkpolicy_*.yaml; do
    data=$(cat "${file}")
    echo '{{- if .Values.ciliumNetworkPolicy.enabled }}' > "${file}"
    echo "${data}" >> "${file}"
    echo '{{- end }}' >> "${file}"
done
