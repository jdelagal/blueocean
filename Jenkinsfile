pipeline {
  agent any
  stages {
    stage('Build') {
      environment {
        CI = 'true'
      }
      steps {
        sh './jenkins/scripts/build.sh'
      }
    }
    stage('Run') {
      steps {
        sh './jenkins/scripts/run.sh'
      }
    }
    stage('Connect') {
      steps {
        sh './jenkins/scripts/connect.sh'
      }
    }
    stage('Deploy') {
      environment {
        CI = 'true'
      }
      steps {
        sh 'apic yes no'
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