# Joulo OCPP Proxy Home Assistant App

This repository provides the **Joulo OCPP Proxy** Home Assistant app for
running [`joulo-ocpp-proxy`](https://github.com/joulo-nl/joulo-ocpp-proxy).

This app is not affiliated with, endorsed by, or supported by Joulo. It only
provides Home Assistant app configuration to run the upstream
`joulo-ocpp-proxy` container image.

## Add this app repository to Home Assistant

1. Open Home Assistant.
2. Go to **Settings** -> **Apps** -> **Install app**.
3. Click the three dots menu (top-right).
4. Click **Add repository**.
5. Add this repository URL:

   ```text
   https://github.com/ricklambrechts/joulo-ocpp-proxy-ha-addon
   ```

6. Click **Add** and refresh the app list.

You should now see the **Joulo OCPP Proxy** app, which provides an OCPP
WebSocket proxy for forwarding to a primary CSMS and mirroring to optional
secondary CSMS backends.

## Configuration

Set the following app options before starting:

- `primary_csms_url` (required), for example `wss://primary.example.com/ocpp`
- `secondary_csms_urls` (optional list)
- `log_level` (optional, default `info`)

The app always listens on container port `9000`. You can change the
host/public port in Home Assistant port mapping settings.

## License

This repository is licensed under the MIT License. See `LICENSE`.

Brand assets in `joulo_ocpp_proxy/logo.png` and `joulo_ocpp_proxy/icon.png`
are third-party assets and excluded from this repository license.

This repository follows the REUSE specification for copyright and licensing
metadata. See `REUSE.toml` and `LICENSES/LicenseRef-Joulo-Logo.txt`.
