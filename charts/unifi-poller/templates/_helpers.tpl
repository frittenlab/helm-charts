{{/*
Expand the name of the chart.
*/}}
{{- define "unifi-poller.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "unifi-poller.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "unifi-poller.chart" -}}
{{- printf "%s-%s" .Chart.Name | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "unifi-poller.labels" -}}
helm.sh/chart: {{ include "unifi-poller.chart" . }}
{{ include "unifi-poller.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "unifi-poller.selectorLabels" -}}
app.kubernetes.io/name: {{ include "unifi-poller.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

Allow the release namespace to be overridden for multi-namespace deployments in combined charts
*/}}
{{- define "unifi-poller.namespace" -}}
{{- if .Values.namespaceOverride -}}
{{- .Values.namespaceOverride -}}
{{- else -}}
{{- .Release.Namespace -}}
{{- end -}}
{{- end -}}
{{/*

{{/*
Create the name of the service account to use
*/}}
{{- define "unifi-poller.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "unifi-poller.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
