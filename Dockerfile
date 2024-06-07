# Use the official Caddy image
FROM caddy:latest

# Copy Caddyfile
COPY Caddyfile /etc/caddy/Caddyfile

# Copy HTML files
COPY site /usr/share/caddy

# Expose port 8080
EXPOSE 8080
