pipeline {
  agent any
  steps {
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
    stage('Connect') {
      steps {
        sh 'docker network connect apiconnectdockermaster_ibmnet  toolkit_running'
      }
    }
    stage('Deploy') {
        sh '''
        pwd'
        ls -ltr
        chmod 775 script.groovy
        ls -ltr
        '''
      }
    }
    stage('Kill') {
      steps {
        sh 'docker stop toolkit_running'
        sh '''docker rm toolkit_running
           '''
      }
    }
  }
}