pipeline {
    agent any

    environment {
        MAVEN_HOME = '/usr/share/maven' 
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean install -DskipTests'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test' // Run tests, even if no tests are present
            }
            post {
                always {
                    junit '**/target/test-*.xml'  // Optional: Include test reports
                }
            }
        }

        stage('Code Coverage') {
            steps {
                script {
                    // Generate code coverage report (if applicable)
                    sh 'mvn jacoco:report'
                }
            }
        }
    }

    post {
        always {
            // Archive build results and reports
            archiveArtifacts artifacts: '**/target/*.jar', allowEmptyArchive: true
            junit '**/target/test-*.xml'
        }
    }
}
