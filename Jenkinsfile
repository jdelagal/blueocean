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
        sh 'sudo cp script.sh /root/script.sh'
        sh 'chmod 775 /root/script.sh'
      }
    }
  }
}