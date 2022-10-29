pipeline {
    agent {label 'agent_1'}
    stages {

        //First using SCM I cloned the private Repo with credential

        stage('build Image') {
            steps {
                sh 'docker build . -t abeer-node.js:$BUILD_TAG'
            }
        }

        stage('Push Image'){
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
                    sh 'docker login -u $USERNAME -p $PASSWORD'
                    sh 'docker push abeer-node.js:$BUILD_TAG'
                }
            }
        }
    }
}