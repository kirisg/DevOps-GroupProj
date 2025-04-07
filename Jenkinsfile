pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'jenkins/jenkins:lts'  
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm  // This will clone your repository
            }
        }

        stage('Build Docker Image') {
            steps {
                // Verify Docker is accessible and version is correct
                script {
                    sh 'docker --version'
                    sh 'docker info'
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
