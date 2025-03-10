pipeline {
    agent any
    environment {
        AWS_REGION = 'us-east-1'
    }
    stages {
        stage('Checkout Code') {
            steps {
                deleteDir() // Clean workspace before checkout
                checkout scm  // Use Jenkins built-in SCM checkout
            }
        }
        stage('Terraform Init & Apply') {
            steps {
                dir('terraform') { // Run Terraform inside the correct directory
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t myapp:latest ${WORKSPACE}' // Use Jenkins workspace
            }
        }
        stage('Push Docker Image') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub', url: '']) {
                    sh 'docker tag myapp:latest yaswanthdevops9/myapp:latest'
                    sh 'docker push yaswanthdevops9/myapp:latest'
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f k8s/'
            }
        }
    }
}
