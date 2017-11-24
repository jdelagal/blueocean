pipeline {
  agent any
  stages {
    stage('Build') {
      environment {
        CI = 'true'
      }
      steps {
        sh 'docker build -t toolkit -f Dockerfile .'
      }
    }
    stage('Run') {
      steps {
        sh 'docker run -d --name toolkit_running -u root -it toolkit'
      }
    }
    stage('Prepare') {
      steps {
        sh 'docker cp deploy toolkit_running:/root'
        sh 'docker exec -i toolkit_running bash'
        sh 'chmod 775 deploy/script.sh'
        sh 'ls -ltr'
      }
    }
    stage('Connect') {
      steps {
        sh 'docker network connect apiconnectdockermaster_ibmnet  toolkit_running'
        sh 'ls -ltr'
        sh 'pwd'
        sleep 120
      }
    }
    stage('Kill') {
      steps {
        sh 'docker stop toolkit_running'
        sh 'docker rm toolkit_running'
      }
    }
  }
}