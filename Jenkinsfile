pipeline{
agent any
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
   sh 'docker build -t test9 . /var/run/docker.sock:/var/run/docker.sock'
  }
 }
 stage('Docker Image'){
  steps{
   sh 'docker images'
  }
 }
 }
 }
