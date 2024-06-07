# static-site# Static Site with Caddy

This repository contains a simple static site served by the Caddy web server.

## Running the Application

### Prerequisites

- Docker

### Build the Docker Image

```sh
docker build -t static-site .
```

### Run the Docker Container

```sh
docker run -d -p 8080:8080 static-site
```

### Access the Application

Open your web browser and navigate to <http://localhost:8080> to view the static site.
