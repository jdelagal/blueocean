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
    stage('Param') {
      steps {
        echo "Visibilidad: ${params.visibilidad}"
      }
    }
    stage('Run') {
      steps {
        sh 'docker run -d --name toolkit_running -u root -it toolkit'
      }
    }
    stage('Prepare') {
      steps {
        sh 'echo "prepare"'
      }
    }
    stage('Connect') {
      steps {
        echo "Visibilidad: ${params.visibilidad}"
        sh 'docker network connect apiconnectdockermaster_ibmnet  toolkit_running'
        sh 'docker exec -i toolkit_running bash -c "./script.sh ${params.visibilidad}"'
        sh 'ls -ltr'
        sh 'pwd'
      }
    }
    stage('Kill') {
      steps {
        sh 'docker stop toolkit_running'
        sh 'docker rm toolkit_running'
      }
    }
  }
  parameters {
    string(defaultValue: 'false', description: '', name: 'visibilidad')
  }
}