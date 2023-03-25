pipeline {
    	agent any
    
	tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven"
	}
	environment{
		DOCKERHUB_CREDENTIALS = credentials('docker')
	}
    stages {
        stage('check out') {
            steps {
                // Get some code from a GitHub repository
                git branch: 'master', url: 'https://github.com/Colin-Moore/lab2comp367'
            }
        }
        stage("build maven"){
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
			sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'                 
			echo 'Login Completed'                
      		} 
	}
	stage("Docker Push"){
		steps{
			script{
				sh "docker push cmoore156/comp367lab3:${env.BUILD_ID}"
			}
		}
	}
						
    }
}
