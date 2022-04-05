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
           sh 'mvn clean package'
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
    stage("publishCode Coverage"){
      steps{
        script{
          publishCoverage adapters: [jacocoAdapter('/target')], sourceFileResolver: sourceFiles('NEVER_STORE')
        }
      }
    }
  }
    
}
