pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        git branch: 'main',
            credentialsId: 'github-credentials',
            url: 'https://github.com/viveksharma9900/terraform-aws-project.git'
      }
    }
    stage('Terraform Version') {
      steps {
        sh 'terraform version || echo "Terraform not installed"'
      }
    }
  }
  post {
    success { echo "Build ${BUILD_NUMBER} SUCCESS" }
    failure { echo "Build ${BUILD_NUMBER} FAILED" }
  }
}
