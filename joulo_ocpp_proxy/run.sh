#!/usr/bin/with-contenv bashio

set -euo pipefail

PRIMARY_CSMS_URL="$(bashio::config 'primary_csms_url')"
LOG_LEVEL="$(bashio::config 'log_level')"

if [[ -z "${PRIMARY_CSMS_URL}" ]]; then
  bashio::log.fatal "PRIMARY_CSMS_URL is required. Set it to your primary CSMS WebSocket URL."
  exit 1
fi

SECONDARY_CSMS_URLS="$(bashio::config 'secondary_csms_urls|join(",")')"

export PRIMARY_CSMS_URL
export SECONDARY_CSMS_URLS
export LOG_LEVEL

exec node /app/dist/index.js
