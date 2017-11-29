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
        sh 'docker exec -i -u root toolkit_running bash -c /root/script.sh'
      }
    }
    stage('Connect') {
      steps {
        sh 'docker network connect apiconnectdockermaster_ibmnet  toolkit_running'
        sh 'ls -ltr'
        sh 'pwd'
        sleep 600
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