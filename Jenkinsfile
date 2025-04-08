pipeline {
    agent any

    environment {
        MAVEN_HOME = '/usr/share/maven'
        
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from GitHub repository
                git 'https://github.com/kirisg/DevOps-GroupProj.git'
            }
        }
        
        

        stage('Build') {
            steps {
                // Build the project using Maven
                sh 'mvn clean install'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
                junit '**/target/test-classes/*.xml' 
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Deploy your application here'
               
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
