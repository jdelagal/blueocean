pipeline {
  agent {
    docker {
      image 'node:9'
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