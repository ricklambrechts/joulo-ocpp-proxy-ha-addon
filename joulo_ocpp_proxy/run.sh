#!/usr/bin/with-contenv bashio

set -euo pipefail

PORT=9000
PRIMARY_CSMS_URL="$(bashio::config 'primary_csms_url')"
PRIMARY_CSMS_APPEND_CHARGE_POINT_ID="$(bashio::config 'primary_csms_append_charge_point_id' 'true')"
LOG_LEVEL="$(bashio::config 'log_level')"
LOG_DEBUG_MESSAGE_MAX_LENGTH="$(bashio::config 'log_debug_message_max_length' '120')"

if [[ -z "${PRIMARY_CSMS_URL}" ]]; then
  bashio::log.fatal "PRIMARY_CSMS_URL is required. Set it to your primary CSMS WebSocket URL."
  exit 1
fi

SECONDARY_CSMS_URLS="$(bashio::config 'secondary_csms_urls|join(",")')"
SECONDARY_CSMS_APPEND_CHARGE_POINT_ID="$(bashio::config 'secondary_csms_append_charge_point_id' 'true')"

export PORT
export PRIMARY_CSMS_URL
export PRIMARY_CSMS_APPEND_CHARGE_POINT_ID
export SECONDARY_CSMS_URLS
export SECONDARY_CSMS_APPEND_CHARGE_POINT_ID
export LOG_LEVEL
export LOG_DEBUG_MESSAGE_MAX_LENGTH

exec node /app/dist/index.js
