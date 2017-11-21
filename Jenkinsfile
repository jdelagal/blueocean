pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t toolkit -f Dockerfile .'
      }
    }
    stage('Run') {
      steps {
        sh 'docker run --name toolkit_running -u root -it -d toolkit bash'
      }
    }
    stage('Connect') {
      steps {
        sh 'docker network connect apiconnectdockermaster_ibmnet  toolkit_running '
      }
    }
    stage('Deploy') {
      environment {
        CI = 'true'
      }
      steps {
        sh 'sh apic yes no'
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