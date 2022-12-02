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


 stage('Docker-Build'){
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
 stage('Docker cleanUp'){
  steps{
   sh 'docker rm -f \$(docker ps -a -q) 2> /dev/null || true'
  }
 }
 
 stage('Docker-Deploy'){
  input{
   message "Do you want to proceed for deployment ?"
  }
  steps{
   sh ' docker run -itd -p 80:80 ${Docker_Image_Name}:${BUILD_NUMBER}'
   sh 'docker ps'
  }
 }
 
 stage('Docker Image CleanUp'){
  steps{
   sh 'docker system prune -af'
  }
 }
 
 }
 post{
  always{
   sh 'docker images'
  }
  aborted{
   sh 'docker ps'
  }
  failure{
   sh ' docker rm -f \$(docker ps -a -q) 2> /dev/null || true'
  }
  success{
   sh 'curl localhost'
  }
 }
 }
