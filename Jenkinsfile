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
                withDockerRegistry(credentialsId: 'docker_hub', url: ''){
                    //sh 'docker login -u $USERNAME -p $PASSWORD'
                    sh 'sudo docker push abeer-node.js:$BUILD_TAG'
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