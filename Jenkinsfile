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
          publishCoverage adapters: [jacocoAdapter('target/site/jacoco/jacoco*.xml')], sourceFileResolver: sourceFiles('NEVER_STORE')
          
        }
      }
    }
    stage("Junit Publish Test"){
      steps{
        script{
          junit allowEmptyResults: true, testDataPublishers: [[$class: 'AttachmentPublisher']], testResults: '/target/surefire-reports/*.xml'
        }
      }
    }
    stage('Local artifact archive') {
      steps {
        script{
        archiveArtifacts artifacts: 'target/*.jar', followSymlinks: false
      }
    }
    }
  }
    
}
