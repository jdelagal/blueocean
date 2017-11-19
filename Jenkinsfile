pipeline {
  agent {
    docker {
      image 'jenkinsci/blueocean'
      args '--network apiconnectdockermaster_ibmnet'
    }
    
  }
  stages {
    stage('error') {
      steps {
        sh 'apic -h'
      }
    }
  }
}