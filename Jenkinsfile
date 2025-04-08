pipeline {
    agent any

    environment {
        MAVEN_HOME = '/usr/share/maven'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/kirisg/DevOps-GroupProj.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
                junit '**/target/test-classes/*.xml' // Adjust the path if necessary
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
