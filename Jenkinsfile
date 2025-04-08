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
                    sh 'docker build -t kirisg/jenkins:latest .' 
                    sh 'docker push kirisg/jenkins:latest'  
                }
            }
        }
    }

    post {
        always {
          
            echo 'Cleaning up after the build...'
        }
    }
}
