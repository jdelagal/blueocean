pipeline {
  agent {
    docker {
      image 'buildpack-deps:jessie'
    }
    
  }
  stages {
    stage('error') {
      steps {
        sh 'npm install -g apiconnect'
      }
    }
  }
}