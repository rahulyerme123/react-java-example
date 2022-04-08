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
    stage("Nexus Repository Upload" ){
      steps{
        script{
         nexusArtifactUploader artifacts: [[artifactId: 'users', classifier: '', 
                                            file: 'target/users-1.0.1.jar',
                                            type: 'jar']], 
                                            credentialsId: 'newnexus', 
                                            groupId: 'com.bbtutorials', 
                                            nexusUrl: '192.168.33.10:8081', 
                                            nexusVersion: 'nexus3', 
                                            protocol: 'http', 
                                            repository: 'Javaapplication',
                                            version: '1.0.1'
        }
      }
    }
  }
    
}
