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
    /*
    stage('Deploy') {
      steps {
        sh 'chmod 775 script.sh'
        sh 'echo "yes no" | ./script.sh'
      }
    }
    */
  }
}