pipeline{
agent any
 environment{
  Docker_Image_Name = 'myimage'
   }
stages {
 stage('Docker'){
 steps{
 sh 'docker --version'
 }
 }
 stage ('Git Version'){
steps{
sh 'git --version'
}
}
 stage('Docker file'){
  steps{
   sh 'docker build -t $Docker_Image_Name .'
  }
 }
 stage('Docker Image'){
  steps{
   sh 'docker images'
  }
 }
 }
 }
