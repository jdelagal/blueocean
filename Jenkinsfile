pipeline {
  agent {
    docker {
      image 'node'
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