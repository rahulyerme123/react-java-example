pipeline{
  
  agent any
  
  tools {
    
       maven 'Apache Maven 3.3.9' 
       }
  stages{
    
     stage('Build Java Application'){
       steps{
         script{
           sh 'mvn clean install'
         }
       }
         
    }
  }
}
