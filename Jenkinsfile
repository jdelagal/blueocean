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
        sh './jenkins/scripts/licence.sh yes no'
        sh './jenkins/scripts/login.sh apim jose.delagala@ust-global.com !n0r1t5@C'
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