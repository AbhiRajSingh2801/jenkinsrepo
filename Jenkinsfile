//jenkins filedemo //
pipeline{
agent any
    
stages{

stage('SCM checkout')
{
    steps{
checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/in28minutes/JavaWebApplicationStepByStep.git']]])
}
}

stage('build'){
    steps{
       sh "mvn clean install"
    }
    
}

stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t JavaWebApplicationStepByStep:latest .' 
                sh 'docker tag JavaWebApplicationStepByStep kushwahabhi28/JavaWebApplicationStepByStep:latest'
                //sh 'docker tag JavaWebApplicationStepByStep kushwahabhi28/JavaWebApplicationStepByStep:$BUILD_NUMBER'
               
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
        withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
          sh  'docker push kushwahabhi28/JavaWebApplicationStepByStep:latest'
        //  sh  'docker push kushwahabhi28/JavaWebApplicationStepByStep:$BUILD_NUMBER' 
        }
                  
          }
        }
     
      stage('Run Docker container on Jenkins Agent') {
             
            steps 
   {
                sh "docker run -d -p 8003:8080 kushwahabhi28/JavaWebApplicationStepByStep"
 
            }
        }
 stage('Run Docker container on remote hosts') {
             
            steps {
                sh "docker -H ssh://jenkins@172.31.28.25 run -d -p 8003:8080 kushwahabhi28/JavaWebApplicationStepByStep"
 
            }
        }
    }
 }



//stage('Deploy'){
  //  steps{
    //   deploy adapters: [tomcat9(credentialsId: 'd1d9c776-88f0-490d-8914-a6af342286e0', path: '', url: 'http://192.168.1.9:8888/')], contextPath: 'in28Minutes-first-webapp-0.0.1-SNAPSHOT.war', war: '**/*.war'
  //  }
    
// }

}
}
