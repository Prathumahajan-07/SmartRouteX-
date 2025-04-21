pipeline {
    agent any

    environment {
        IMAGE_NAME = "smartroutex"
    }

    triggers {
        // Optional: if you have GitHub webhook
        pollSCM('* * * * *') // or use GitHub webhook trigger
    }

    stages {
        stage('Check Branch') {
            when {
                branch 'main'
            }
            steps {
                echo "We're on the main branch — proceeding with pipeline."
            }
        }

        stage('Clone Code') {
            when {
                branch 'main'
            }
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            when {
                branch 'main'
            }
            steps {
                script {
                    dockerImage = docker.build("${IMAGE_NAME}")
                    echo "Docker image built: ${IMAGE_NAME}"
                }
            }
        }

        stage('Run Docker Container') {
            when {
                branch 'main'
            }
            steps {
                script {
                    dockerImage.run('-d -p 5000:5000')
                    echo "Docker container running on port 5000"
                }
            }
        }
    }

    post {
        failure {
            echo "Pipeline failed."
        }
        success {
            echo "Pipeline for 'main' branch completed successfully!"
        }
    }
}
