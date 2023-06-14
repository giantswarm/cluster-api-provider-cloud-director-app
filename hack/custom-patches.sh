#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

YQ="yq"

f="config/kustomize/tmp/apps_v1_deployment_capvcd-controller-manager.yaml"
${YQ} e '.spec.template.spec.securityContext.remove-this-key="'"
{{- with .Values.securityContext }}
  {{- . | toYaml | nindent 8 }}
{{- end }}
"'" | .spec.template.spec.containers[].securityContext.remove-this-key="'"
{{- with .Values.podSecurityContext }}
  {{- . | toYaml | nindent 12 }}
{{- end }}
"'"' ${f} > ${f}.tmp
grep -v 'remove-this-key' "${f}.tmp" > ${f}
rm -rf ${f}.tmp
