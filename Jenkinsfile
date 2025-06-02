pipeline {
    agent any

    environment {
        IMAGE_NAME = 'flask-hello-world'
        CONTAINER_NAME = 'flask-container'
        PORT = '5000'
    }

    stages {
        stage('Clean Old Container') {
            steps {
                bat 'docker rm -f %CONTAINER_NAME% || echo "No existing container to remove."'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t %IMAGE_NAME% .'
            }
        }

        stage('Run Docker Container') {
            steps {
                bat 'docker run -d -p %PORT%:5000 --name %CONTAINER_NAME% %IMAGE_NAME%'
            }
        }
    }

    post {
        failure {
            echo "❌ Build or deployment failed. Check logs."
        }
    }
}