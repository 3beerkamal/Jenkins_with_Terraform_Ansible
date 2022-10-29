pipeline {
    agent {label 'agent_2'}
    stages {

        //First using SCM I cloned the private Repo with credential

        stage('build Image') {
            steps {
                sh 'docker build . -t 3beerkamal/abeer-node.js:$BUILD_TAG'
            }
        }
        stage('Push Image'){
            steps{
                withDockerRegistry([credentialsId: 'node_cred', url: ""]){
                    //sh 'docker login -u $USERNAME -p $PASSWORD'
                    sh 'docker push 3beerkamal/abeer-node.js:$BUILD_TAG'
                }
            }
        }
        stage('Deploy Image'){
            steps {
                withDockerRegistry([credentialsId: 'node_cred', url: ""]){
                    sh 'docker run -d -p 3000:3000 --name myapp 3beerkamal/abeer-node.js:$BUILD_TAG'
                }
            }
        }
    }
}