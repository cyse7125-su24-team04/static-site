pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                script {
                    checkout([
                        $class: 'GitSCM',
                        branches: [[name: 'main']],
                        userRemoteConfigs: [[credentialsId: 'github_token', url: 'https://github.com/cyse7125-su24-team04/static-site.git']]
                    ])
                }
            }
        }

        stage('Setup Docker Buildx') {
            steps {
                script {
                    // Delete existing buildx instance if it exists
                    sh 'docker buildx rm mybuilder || true'
                    // Set up Docker Buildx
                    sh 'docker buildx create --name mybuilder --use'
                    sh 'docker buildx inspect --bootstrap'

                }
            }
        }

        stage('Build Multi-platform Docker Image') {
            steps {
                script {
                    def buildNumber = env.BUILD_NUMBER
                    echo "Build number is ${buildNumber}"
                    withCredentials([usernamePassword(credentialsId: 'dockerhub_credentials', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                        sh "echo \$DOCKERHUB_PASSWORD | docker login -u \$DOCKERHUB_USERNAME --password-stdin"
                    }
                    
                    // Build multi-platform Docker image
                    sh """
                        docker buildx build --platform linux/amd64,linux/arm64 \
                        -t vamsidharp/static-site-test:${buildNumber} \
                        -t vamsidharp/static-site-test:latest \
                        --push .
                    """
                }
            }
        }
    }
}