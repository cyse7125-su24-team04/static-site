# static-site

## Run local Docker container running Caddy to serve the HTML file

1. Build the Docker image:
   ```bash
   docker build -t my-caddy-server:0.1.0 .
   ```

2. Run the Docker container:
   ```bash
   docker run -d -p 8080:80 my-caddy-server
   ```
    (This command starts a container named my-caddy-server in detached mode (-d), mapping port 8080 on your local machine to port 80 in the container (-p 8080:80).)

3. Run helm-caddy-app
   ```
   docker build -t my-caddy-server:0.1.0 -f './Dockerfile' .
   kubectl apply -f ./k8s/k8s-namespace.yaml 
   kubectl apply -f ./k8s/k8s-deployment.yaml
   kubectl apply -f ./k8s/k8s-service.yaml  
   minikube service caddy-helm -n caddy-helm 
   ```
   ```
   helm install caddy-helm --namespace caddy-helm --create-namespace ./caddy-helm
   ```