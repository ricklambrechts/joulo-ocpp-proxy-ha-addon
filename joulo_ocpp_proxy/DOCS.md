# Joulo OCPP Proxy

Home Assistant add-on that runs the
[`joulo-ocpp-proxy`](https://github.com/joulo-nl/joulo-ocpp-proxy).

This add-on is not affiliated with, endorsed by, or supported by Joulo. It
only provides Home Assistant add-on configuration for the upstream
`joulo-ocpp-proxy` image.

If you want to thank me, you can use this referral link: [joulo.nl/signup?ref=7QP7GK](https://joulo.nl/signup?ref=7QP7GK).

The proxy accepts charger OCPP WebSocket connections, forwards traffic to one
primary CSMS, and optionally mirrors charger-to-CSMS messages to one or more
secondary CSMS backends.

## Configuration

### `primary_csms_url` (required)

Primary backend URL, including protocol and path.

Examples:

- `wss://primary.example.com/ocpp`
- `ws://192.168.1.10:8080/ocpp`

### `primary_csms_append_charge_point_id` (optional)

Append the charge point ID from the incoming charger URL to the primary CSMS
URL. Default: `true`.

Set this to `false` when the primary CSMS URL already identifies the charger
or expects no charge point ID path suffix.

### `secondary_csms_urls` (optional)

List of additional backend URLs that receive mirrored charger messages.

Example:

```yaml
secondary_csms_urls:
  - wss://analytics.example.com/ocpp
  - wss://audit.example.com/ocpp
```

### `secondary_csms_append_charge_point_id` (optional)

Append the charge point ID from the incoming charger URL to every secondary
CSMS URL. Default: `true`.

Set this to `false` when the secondary CSMS URLs already identify the charger
or expect no charge point ID path suffix.

### `log_level` (optional)

Logging level. One of:

- `debug`
- `info`
- `warn`
- `error`

Default: `info`

### `log_debug_message_max_length` (optional)

Maximum number of characters in debug payload summaries. Default: `120`.
Enter a positive integer, or leave it empty to disable truncation.

The app always listens on container port `9000`.
If needed, change the host-side port mapping in Home Assistant.

## Charger setup

Point each charger's OCPP backend URL to this add-on host and port, keeping the
charger ID in the path.

Example:

```text
ws://homeassistant.local:9000/CHARGER-001
```

By default, the proxy appends the charge point ID to each upstream CSMS URL.
You can configure this independently for the primary and secondary CSMS URLs.

## Notes

- Use `wss://` for internet-facing CSMS endpoints.
- If chargers connect from outside your LAN, place TLS termination and access
  control in front of Home Assistant.
