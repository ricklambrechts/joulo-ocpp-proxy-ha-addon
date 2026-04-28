ARG JOULO_OCPP_PROXY_VERSION=main

FROM ghcr.io/joulo-nl/joulo-ocpp-proxy:${JOULO_OCPP_PROXY_VERSION} AS upstream

FROM ghcr.io/home-assistant/base:latest

RUN apk add --no-cache nodejs
WORKDIR /app

COPY --from=upstream /app/package*.json /app/
COPY --from=upstream /app/node_modules /app/node_modules
COPY --from=upstream /app/dist /app/dist

COPY run.sh /run.sh
RUN chmod a+x /run.sh
CMD ["/run.sh"]
