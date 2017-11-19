pipeline {
  agent none
  stages {
    stage('build') {
      steps {
        sh 'docker build -t toolkit -f Dockerfile .'
      }
    }
  }
}