pipeline {
    agent any 
    tools {
        nodejs 'Node20'
    }
    stages('clean Workspace'){
        steps {
            cleanWs()
        }
    }
    stage('checkout from Git'){
        steps {

        }
    }
    stage('Build Docker image'){
        steps {
            sh '''
                docker build -t thomson-portfolio-v1 .
            '''
        }
    }
    stage('Deploy to container'){
        steps{
            sh '''
                docker rm -f thomson-portfolio-v1 || true
                docker run -d \
                    --name thomson-portfolio \
                    --restart unless-stopped \
                    -p 3000:3000 \
            '''
        }
    }
    stage('verify Deployment'){
        steps{
            sh '''
                docker ps 
                docker logs --tail 20 thomson-portfolio
            '''
        }
    }
}
post {
    success {
        echo 'thomson portfolio deployed successfully'
    }
    failure {
        echo 'Deployment failed. check jenkins console output'
    }
}