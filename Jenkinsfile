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
        sh 'docker run --name toolkit_running -u root -it -d toolkit'
      }
    }
    stage('Connect') {
      steps {
        sh 'docker network connect apiconnectdockermaster_ibmnet  toolkit_running'
      }
    }
    stage('Deploy') {
      steps {
        sh 'pwd'
        sh '$pwd/jenkins/scripts chmod 777 *'
        sh '$pwd/jenkins/scripts ls -ltr'
        sh 'ls -ltr'
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