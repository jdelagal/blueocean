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
        sh 'docker run --rm toolkit_running -ti -d  toolkit bash'
      }
    }
  }
}