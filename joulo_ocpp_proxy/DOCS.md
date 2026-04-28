# Joulo OCPP Proxy

Home Assistant add-on that runs the
[`joulo-ocpp-proxy`](https://github.com/joulo-nl/joulo-ocpp-proxy).

This add-on is not affiliated with, endorsed by, or supported by Joulo. It
only provides Home Assistant add-on configuration for the upstream
`joulo-ocpp-proxy` image.

The proxy accepts charger OCPP WebSocket connections, forwards traffic to one
primary CSMS, and optionally mirrors charger-to-CSMS messages to one or more
secondary CSMS backends.

## Configuration

### `primary_csms_url` (required)

Primary backend URL, including protocol and path.

Examples:

- `wss://primary.example.com/ocpp`
- `ws://192.168.1.10:8080/ocpp`

### `secondary_csms_urls` (optional)

List of additional backend URLs that receive mirrored charger messages.

Example:

```yaml
secondary_csms_urls:
  - wss://analytics.example.com/ocpp
  - wss://audit.example.com/ocpp
```

### `log_level` (optional)

Logging level. One of:

- `debug`
- `info`
- `warn`
- `error`

Default: `info`

The app always listens on container port `9000`.
If needed, change the host-side port mapping in Home Assistant.

## Charger setup

Point each charger's OCPP backend URL to this add-on host and port, keeping the
charger ID in the path.

Example:

```text
ws://homeassistant.local:9000/CHARGER-001
```

The proxy appends the charge point ID to each upstream CSMS URL.

## Notes

- Use `wss://` for internet-facing CSMS endpoints.
- If chargers connect from outside your LAN, place TLS termination and access
  control in front of Home Assistant.
