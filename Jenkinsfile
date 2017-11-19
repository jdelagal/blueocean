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
        sh 'docker run --name toolkit_running -it -d toolkit bash'
      }
    }
    stage('Connect') {
      steps {
        sh 'docker network connect apiconnectdockermaster_ibmnet  toolkit_running '
      }
    }
    stage('Deploy') {
      steps {
        sh 'echo "deploy"'
      }
    }
    stage('Stop') {
      steps {
        sh 'docker stop toolkit_running'
      }
    }
    stage('Kill') {
      steps {
        sh '''docker rm toolkit_running
'''
      }
    }
  }
}