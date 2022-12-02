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
   sh 'docker build -t jenkins-test .'
   sh 'docker tag jenkins-test:latest public.ecr.aws/z1i5d8y3/jenkins-test:latest'
   sh 'docker push public.ecr.aws/z1i5d8y3/jenkins-test:latest'
  }
 }
 stage('Docker Image'){
  steps{
   sh 'docker images'
  }
 }
 }
 }
