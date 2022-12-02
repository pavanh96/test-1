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


 stage('Docker file'){
  steps{
   sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 230226440659.dkr.ecr.us-east-1.amazonaws.com'
   sh 'docker build -t jenkinstest .'
   sh 'docker tag jenkinstest:latest 230226440659.dkr.ecr.us-east-1.amazonaws.com/jenkinstest:latest'
   sh 'docker push 230226440659.dkr.ecr.us-east-1.amazonaws.com/jenkinstest:latest'
  }
 }
 stage('Docker Image'){
  steps{
   sh 'docker images'
  }
 }
 }
 }
