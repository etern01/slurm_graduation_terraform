{{/*
Template for outputing the kasAddress
*/}}
{{- define "gitlab-agent.kasAddress" -}}
{{- if .Values.gitlabDomain }}
{{- $urlHost := regexReplaceAll "^(?:.*://)?([^/]+).*" .Values.gitlabDomain "${1}" }}
{{- printf "wss://%s/-/kubernetes-agent/" $urlHost }}
{{- else }}
{{- .Values.config.kasAddress }}
{{- end }}
{{- end }}
