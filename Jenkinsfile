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
   sh 'sudo su'
   sh 'docker build -t test .'
  }
 }
 }
 }
