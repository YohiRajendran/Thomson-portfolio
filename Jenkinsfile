
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
<<<<<<< HEAD

=======
>>>>>>> fb7a78a (updated files)
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
    }

    post {
        success {
<<<<<<< HEAD
            echo 'Thomson portfolio deployed successfully'
        }

        failure {
            echo 'Deployment failed. Check Jenkins console output'
=======
            echo 'Thomson portfolio deployed successfully!'
        }

        failure {
            echo 'Deployment failed. Check Jenkins console output.'
>>>>>>> fb7a78a (updated files)
        }
    }
}
