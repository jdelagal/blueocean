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
    
    stage('Connect') {
      steps {
        sh 'docker network connect apiconnectdockermaster_ibmnet  toolkit_running'
        sh 'ls -ltr'

      }
    }
    stage('Deploy') {
      steps {
        sh 'pwd'
        sh 'ls -ltr'
        sh 'chmod 775 script.groovy'
        sh 'chmod 775 script.sh'
        sh 'ls -ltr'
        load 'script.groovy'
        sh 'ls -ltr'
      }
    }
    /*
    stage('Kill') {
      steps {
        sh 'docker stop toolkit_running'
        sh '''docker rm toolkit_running
           '''
      }
    }
    */
  }
}