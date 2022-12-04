pipeline{
agent any
 environment{
  Docker_Image_Name = 'myimage'
  Docker_Tag= 'v1'
   }
stages {
 stage ('pre-check'){
  parallel {
   stage ('Docker-version'){
    steps{
     retry(3){
      sh 'docker --version'
     }
    }     
 }
 stage ('Git Version'){
steps{
sh 'git --version'
}
}
  }
 }


 stage('Docker Image to ECR'){
  steps{
   sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 230226440659.dkr.ecr.us-east-1.amazonaws.com'
   sh 'docker build -t jenkins-test .'
   sh 'docker tag jenkins-test:latest 230226440659.dkr.ecr.us-east-1.amazonaws.com/jenkins-test:${BUILD_NUMBER}'
   sh 'docker push 230226440659.dkr.ecr.us-east-1.amazonaws.com/jenkins-test:${BUILD_NUMBER}'
  }
 }
 stage('Docker Deploy'){
  steps{
   sh ' docker run -itd -p 8081:9002 docker push 230226440659.dkr.ecr.us-east-1.amazonaws.com/jenkins-test:${BUILD_NUMBER}'
   sh ' docker ps'
  }
 }
 stage('Prod-Deploy'){
  steps{
    sshagent(['Prod']) {

                sh "ssh -o StrictHostKeyChecking=no -l ubuntu 172.31.84.117 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 230226440659.dkr.ecr.us-east-1.amazonaws.com'"

                 sh "ssh -o StrictHostKeyChecking=no -l ubuntu 172.31.84.117 'sudo docker run -itd -p 80:80 230226440659.dkr.ecr.us-east-1.amazonaws.com/jenkins-test:${BUILD_NUMBER}'"
  }
 }
 }
 stage('Docker Image'){
  steps{
   sh 'docker images'
  }
 }
 }
 }
