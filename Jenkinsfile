pipeline {
    agent {
        docker {
            image 'maven:3.9.0-eclipse-temurin-11' 
            args '-v /root/.m2:/root/.m2' 
        }
    }
     environment {
		DOCKERHUB_CREDENTIALS=credentials('docker')
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
                    sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
    }
}
