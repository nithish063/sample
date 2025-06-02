pipeline {
    agent any

    environment {
        IMAGE_NAME = 'flask-hello-world'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build & Test') {
            steps {
                bat """
                docker build -t %IMAGE_NAME% -f Dockerfile.test .
                docker run --rm %IMAGE_NAME% pytest
                """
            }
        }

        stage('Build Image') {
            steps {
                bat "docker build -t %IMAGE_NAME% ."
            }
        }
    }

    post {
        always {
            bat "docker system prune -f"
        }
        success {
            echo 'Build and tests successful!'
        }
        failure {
            echo 'Build or tests failed.'
        }
    }
}
