@Grab('org.yaml:snakeyaml:1.17')
import org.yaml.snakeyaml.Yaml
import org.yaml.snakeyaml.DumperOptions
import static org.yaml.snakeyaml.DumperOptions.FlowStyle.BLOCK
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
    stage('Prepare') {
      steps {
        sh 'echo "prepare"'
      }
    }
    stage('Connect') {
      steps {
        sh 'docker network connect apiconnectdockermaster_ibmnet  toolkit_running'
        sh 'docker exec -i toolkit_running bash -c ./script.sh'
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
}