pipeline {
  agent any
  stages {
    stage('Example') {
      steps {
        echo "Hello ${params.Organizacion}"
      }
    }
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
    stage('Prepare') {
      steps {
        sh 'echo "prepare"'
      }
    }
    stage('Connect') {
      steps {
        sh 'docker network connect apiconnectdockermaster_ibmnet  toolkit_running'
        sh "docker exec -i toolkit_running bash -c ./script.sh ${params.Organizacion}"
        sh 'ls -ltr'
        sh 'pwd'
      }
    }
    stage('Kill') {
      steps {
        sh 'docker sto toolkit_running'
        sh 'docker rm toolkit_running'
      }
    }
  }
  parameters {
    string(defaultValue: 'false', description: 'visibilidad por organizacion', name: 'Organizacion')
  }
}