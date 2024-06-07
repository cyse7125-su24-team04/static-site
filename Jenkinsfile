pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials')
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/mihiradelkar/static-site.git'
            }
        }
        stage('Build Image') {
            steps {
                script {
                    docker.build("mihiradelkar/static-site:latest")
                }
            }
        }
        stage('Login to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials') {
                        echo 'Logged in to Docker Hub'
                    }
                }
            }
        }
        stage('Push Image') {
            steps {
                script {
                    docker.image("mihiradelkar/static-site:latest").push()
                }
            }
        }
    }
}
