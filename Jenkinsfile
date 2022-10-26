pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                sh 'docker build . -t jenkins-node.js:$BUILD_TAG'
            }
            post {
                success {
                    sh 'echo sucess'
                }
                failure {
                    sh 'fail'
                }
            }
        }
    }
}