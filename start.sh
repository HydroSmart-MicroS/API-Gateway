#!/bin/sh
set -eu
config_file="${CONFIG_FILE:-/etc/hydrosmart/gateway.env}"
if [ -f "$config_file" ]; then
  while IFS='=' read -r key value; do
    case "$key" in
      IDENTITY_UPSTREAM|PROPERTIES_UPSTREAM|TELEMETRY_UPSTREAM|ANALYTICS_UPSTREAM|REPORTS_UPSTREAM|NOTIFICATIONS_UPSTREAM|BILLING_UPSTREAM)
        if ! printenv "$key" >/dev/null 2>&1; then export "$key=$value"; fi ;;
      '') ;;
      *) echo "Unexpected configuration key" >&2; exit 1 ;;
    esac
  done < "$config_file"
fi
exec caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
