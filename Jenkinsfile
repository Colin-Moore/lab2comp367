pipeline {
    agent {
        docker {
            image 'maven:3.9.0-eclipse-temurin-11' 
            args '-v /root/.m2:/root/.m2' 
        }
    }
	 tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven"
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
		    withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'password', usernameVariable: 'username')]) {
			sh "docker login -u $username -p $password ..."
		    }
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
