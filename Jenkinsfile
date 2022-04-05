def ver

pipeline{
  
 /* environment {
    IMAGE = readMavenPom().getArtifactId()
    VERSION = readMavenPom().getVersion()
    }
*/
  
  
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
    stage("Create Version Of java Application"){
      steps{
        script{
         ver = "${env.GIT_BRANCH}--${env.BUILD_NUMBER}"
        echo "${ver}"
      }
      }  
    }  
  }
    
}
