pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'mouhcineazelmat/cicd-demo-angular-app'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Mouhcine-Azelmat99/CiCdPipelineAppDemo/'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKER_IMAGE}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhubtoken') {
                        docker.image("${DOCKER_IMAGE}:latest").push('latest')
                    }

                }
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying to cloud provider ..."
            }
        }
    }

    post {
        success {
            echo 'Pipeline succeeded '
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
