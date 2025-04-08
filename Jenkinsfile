pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'jenkins/jenkins:lts'  
        MAVEN_HOME = tool name: 'Maven 3.6.3', type: 'Maven'
    }
stages {
     

        stage('Checkout') {
            steps {
                checkout scm  
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t ${DOCKER_IMAGE} .'
                }
            }
        }

         stage('Build') {
            steps {
                script {
                    // Build the project using Maven
                    sh "mvn clean install"
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    // Run unit tests and generate code coverage report
                    sh "mvn test jacoco:report"
                }
            }
        }
    }
    post {
        always {
            // Clean up or any post-action tasks
            cleanWs()
        }
    }
}
