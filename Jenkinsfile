pipeline {
  agent {
    dockerfile {
      filename 'Dockerfile'
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