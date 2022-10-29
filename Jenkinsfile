pipeline {
    agent {label 'agent_2'}
    stages {

        //First using SCM I cloned the private Repo with credential

        stage('build Image') {
            steps {
                sh 'docker build . -t abeer-node.js:$BUILD_TAG'
            }
        }
        stage('Push Image'){
            steps{
                withCredentials([string(credentialsId: 'docker_hub2', variable: '3beer')]) {
                    sh 'docker login -u 3beerkamal -p ${3beer}'
                    sh 'docker push abeer-node.js:$BUILD_TAG'
                }
            }
        }
        stage('Deploy Image'){
            steps {
                sh 'docker run -d -t myapp abeer-node.js:$BUILD_TAG'
            }
        }
    }
}