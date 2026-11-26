
pipeline {
    agent any

    tools {
        nodejs 'Node20'
    }

    stages {

        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }

        stage('Checkout from Git') {
            steps {
                git branch: 'main',
                    changelog: false,
                    poll: false,
                    url: 'https://github.com/YohiRajendran/Thomson-portfolio.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh '''
                    docker build -t thomson-portfolio-v1 .
                '''
            }
        }

        stage('Deploy to Container') {
            steps {
                sh '''
                    docker rm -f thomson-portfolio || true

                    docker run -d \
                        --name thomson-portfolio \
                        --restart unless-stopped \
                        -p 3000:3000 \
                        thomson-portfolio-v1
                '''
            }
        }

        stage('Verify Deployment') {
            steps {
                sh '''
                    docker ps
                    docker logs --tail 20 thomson-portfolio
                '''
            }
        }
        stage('Deploy to k8s container'){
            steps{
                script{
                    dir('Kubernetes') {
                        withKubeConfig(caCertificate: '', clusterName: '' , contectName: '', credentialsId: 'k8s', namespace: '', restrictKubeConfigAccess: false, serverUrl: ''){
                            sh 'kubectl apply -f deployment.yaml'
                            sh 'kubectl apply -f service.yaml'
                        }
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Thomson portfolio deployed successfully'
        }

        failure {
            echo 'Deployment failed. Check Jenkins console output'
        }
    }
}
