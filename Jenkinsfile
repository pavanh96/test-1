pipeline{
agent any
 environment{
  Docker_Image_Name = 'myimage'
  Docker_Tag= 'v1'
   }
stages {
 stage('Docker'){
 steps{
  retry(3){
 sh 'docker --version'
 }
  timeout(time:2, unit:'SECONDS'){
   sh 'sleep 10'
  }
 }
 }
 stage ('Git Version'){
steps{
sh 'git --version'
}
}
 stage('Docker file'){
  steps{
   sh 'docker build -t ${Docker_Image_Name}:${BUILD_NUMBER} .'
  }
 }
 stage('Docker Image'){
  steps{
   sh 'docker images'
  }
 }
 }
 }
