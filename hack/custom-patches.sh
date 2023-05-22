#!/bin/bash

set -x
YQ=${2:-./bin/yq}
# ${1} is the given application-name from make (cluster-api-provider-cloud-director)
# ${2} is path to yq

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
cat ${f}.tmp | grep -v 'remove-this-key' > ${f}
rm -rf ${f}.tmp
