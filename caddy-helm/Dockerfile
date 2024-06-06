FROM caddy:latest

# Copy Caddyfile and HTML page into the container
COPY Caddyfile /etc/caddy/Caddyfile
COPY template/site/index.html /usr/share/caddy/index.html

# Expose the Caddy server port
EXPOSE 8080
