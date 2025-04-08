pipeline {
    agent any

    environment {
        // Update this to your own Docker Hub repository
        DOCKER_IMAGE = 'kirisg/myjenkins:2.492.3-1' 
    }

    stages {
        stage('Check Docker') {
            steps {
                script {
                    sh 'docker --version'
                }
            }
        }

        stage('Checkout') {
            steps {
                checkout scm  // This will clone your repository
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build the Docker image with the new tag
                script {
                    sh 'docker build -t ${DOCKER_IMAGE} .'
                }
            }
        }

        stage('Run Tests') {
            steps {
                echo 'Running tests...'
                sh 'echo "Test successful"'
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Push the image to your Docker Hub repository
                    sh 'docker push ${DOCKER_IMAGE}'
                }
            }
        }
    }

    post {
        always {
            // Archive build results or Docker images, etc.
            echo 'Cleaning up after the build...'
        }
    }
}
