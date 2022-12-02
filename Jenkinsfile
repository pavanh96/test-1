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
      sh 'sleep 20'
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
   when{
    expression{
      return GIT_BRANCH == "origin/test" 
    }
   }
   sh 'docker build -t ${Docker_Image_Name}:${BUILD_NUMBER} .'
   sh ' docker inspect ${Docker_Image_Name}:${BUILD_NUMBER} '
  }
 }
 stage('Docker Image'){
  steps{
   sh 'docker images'
  }
 }
 }
 }
