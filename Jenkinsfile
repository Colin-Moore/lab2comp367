pipeline {
    agent {
        docker {
            image 'maven:3.9.0-eclipse-temurin-11' 
            args '-v /root/.m2:/root/.m2' 
        }
    }
  
    stages {
        stage("check out"){
            steps{
                echo "current build: ${env.BUILD_ID}"
                      git branch: 'master', url: 'https://github.com/Colin-Moore/lab2comp367'
             }
        }
        stage("Build"){
            steps{
                sh 'mvn clean install'
            }
        }
        stage("Docker build"){
            steps{
                script{
                    sh "docker build -t cmoore156/comp367lab3:${env.BUILD_ID} ."
                }
            }
        }
        stage("Docker login"){
            steps{
                script{
              		withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'dockerhub_pwd', usernameVariable, 'dockerhub_user')]
					{
						sh "docker login --username \$(dockerhub-user) --password \$(dockerhub_pwd)"
						sh "docker login -u cmoore156 -p X15qrA85fF'
		}
	    }
	}
    }
}
