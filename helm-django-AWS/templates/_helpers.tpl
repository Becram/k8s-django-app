{{- define "base_labels" }}
{{ .Values.projectIdentifier }}: {{ .Chart.Name }}
release: {{ .Release.Name }}
chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}

{{- define "django_labels" }}
{{- include "base_labels" . }}
{{ .Values.appIdentifier }}: {{ .Values.rcDjango.app }}
{{ .Values.tierIdentifier }}: {{ .Values.rcDjango.tier }}
{{- end }}

{{- define "django_metadata" }}
metadata:
  name: {{ .Chart.Name }}-worker
  labels:
    {{- include "django_labels" . | indent 4 }}
{{- end }}


{{- define "postgres_labels" }}
{{- include "base_labels" . }}
{{ .Values.appIdentifier }}: {{ .Values.rcPostgres.app }}
{{ .Values.tierIdentifier }}: {{ .Values.rcPostgres.tier }}
{{- end }}

{{- define "postgres_metadata" }}
metadata:
  name: {{ .Chart.Name }}-postgres
  labels:
    {{- include "postgres_labels" . | indent 4 }}
{{- end }}