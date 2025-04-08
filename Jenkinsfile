pipeline {
   agent {
        docker {
            image 'maven:3.8.1-jdk-11'  
            
        }
    }

    environment {
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
                checkout scm  // pipeline checkout stage
            }
        }

        stage('Build') {
            steps {
                script {
                    sh 'mvn clean install' 
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    sh 'mvn test'  
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    sh 'docker build -t yourusername/jenkins:latest .' 
                    sh 'docker push yourusername/jenkins:latest'  
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
