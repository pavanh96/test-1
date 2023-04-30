pipeline{
    agent any
    tools{
        maven 'maven-3.8.6'
    }
 environment{
  Docker_Image_Name = 'myimage'
  Docker_Tag= 'v1'
  registry='230226440659.dkr.ecr.us-east-1.amazonaws.com/jenkins-test'
  registryCredentinal = 'jenkis-ecr-login'
   }
    stages{
       
        stage("Checkout project"){
            steps{
                git branch: 'master', url: 'https://github.com/pavanh96/realtime-project-demo.git' 
            }
        }
        
        stage("Maven package"){
            steps{
                sh 'mvn clean package'
            }
        }
        stage("build & SonarQube analysis") {
            steps {
                script{
              withSonarQubeEnv(installationName: 'sonar-9' , credentialsId: 'sonar-token' ) {
                sh 'mvn clean package sonar:sonar'
              }
               timeout(time: 1, unit: 'HOURS') {
              def qg = waitForQualityGate()
              if (qg.status != 'OK') {
                  error "Pipeline aborted due to quality gate failure: ${qg.status}"
              }
          }
            }
      
            }
        }
        stage('Test Docker'){
            steps{
                sh ' docker images'
            }
        }
        stage('Docker build'){
            steps{
              sh ' docker build -t jenkins-test:$BUILD_NUMBER . '
            }
        }
        stage('ECR Login'){
            steps{
           sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 230226440659.dkr.ecr.us-east-1.amazonaws.com'
          
            }
        }
        stage('ECR Push'){
            steps{
                sh 'docker tag jenkins-test:$BUILD_NUMBER 230226440659.dkr.ecr.us-east-1.amazonaws.com/jenkins-test:$BUILD_NUMBER'
               
            sh 'docker push 230226440659.dkr.ecr.us-east-1.amazonaws.com/jenkins-test:$BUILD_NUMBER'
        }
        }
        }
    }
    
     post {
        success {
            mail bcc: '', body: 'Pipeline build successfully', cc: '', from: 'halaharvipavan1996@gmail.com', replyTo: '', subject: 'The Pipeline success', to: 'shikhardevops@gmail.com'
        }
        failure {  
            mail bcc: '', body: 'Pipeline build not success', cc: '', from: 'halaharvipavan1996@gmail.com', replyTo: '', subject: 'The Pipeline failed', to: 'shikhardevops@gmail.com'
         } 
    }




//extra




pipeline{
    agent any
    tools{
        maven 'maven-3.6.3'
        
    }
    stages{
        // stage('Build'){
        //     steps{
        //   sh "mvn clean install"
        // }
        // }
        
      
        stage("java-17"){
            tools{
                jdk 'java-17'
            }
            steps{
                sh 'java --version'
            }
        }
        stage("java-11"){
            tools{
                jdk 'java-11'
            }
            
            steps{
                 
                sh 'java --version'
            }
        }
         stage("build & SonarQube analysis") {
            steps {
                script{
              withSonarQubeEnv(installationName: 'sonar-9.9' , credentialsId: 'test' ) {
                sh 'mvn clean package sonar:sonar'
              }
               timeout(time: 1, unit: 'HOURS') {
              def qg = waitForQualityGate()
              if (qg.status != 'OK') {
                  error "Pipeline aborted due to quality gate failure: ${qg.status}"
              }
          }
            }
      
            }
        }
        
    }
}
