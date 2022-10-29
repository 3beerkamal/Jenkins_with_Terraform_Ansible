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
            withCredentials([usernamePassword(credentialsId: 'docker_hub', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
                    sh 'docker login -u $USERNAME -p $PASSWORD'
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