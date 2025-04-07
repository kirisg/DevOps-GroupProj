pipeline {
    agent any

    environment {
        SONARQUBE = 'sonarqube' 
        MAVEN_HOME = '/usr/share/maven' 
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('SonarQube Analysis') {
            steps {
                script {
                    // Run SonarQube static code analysis
                    withSonarQubeEnv('SonarQube') {
                        sh "mvn clean verify sonar:sonar"
                    }
                }
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
                    junit '**/target/test-*.xml'  // Optional: Include code coverage reports if available
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
