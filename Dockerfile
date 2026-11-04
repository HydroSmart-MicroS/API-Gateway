FROM caddy:2.10-alpine
COPY Caddyfile routes.caddy /etc/caddy/
COPY start.sh /usr/local/bin/start-gateway
USER 10001:10001
EXPOSE 8080
ENTRYPOINT ["/bin/sh", "/usr/local/bin/start-gateway"]
