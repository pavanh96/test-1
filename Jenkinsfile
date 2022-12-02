pipeline{
agent any
 environment{
  Docker_Image_Name = 'myimage'
  Docker_Tag= 'v1'
   }
 options { 
  timestamps()
  buildDiscarder(logRotator(numToKeepStr: '10')) 
  disableConcurrentBuilds()
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
   when{
    expression{
      return GIT_BRANCH == "origin/pavan" 
    }
   }
  steps{
   sh 'docker build -t ${Docker_Image_Name}:${BUILD_NUMBER} .'
   sh ' docker inspect ${Docker_Image_Name}:${BUILD_NUMBER} '
  }
 }
 stage('Docker-Deploy'){
  steps{
   sh ' docker run -itd -p 80:80'
   sh ' ${Docker_Image_Name}:${BUILD_NUMBER}'
   sh 'docker ps'
  }
 }
 
 stage('Docker Image'){
  steps{
   sh 'docker images'
  }
 }
 }
 }
