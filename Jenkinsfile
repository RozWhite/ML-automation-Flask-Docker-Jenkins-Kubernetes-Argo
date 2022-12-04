pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
	}

	stages {

		stage('Build') {

			steps {
			
                sh "docker build -t rozitadocker123/mlops-jenkins:'${env.BUILD_NUMBER}' ."
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
                sh "docker push rozitadocker123/mlops-jenkins:'${env.BUILD_NUMBER}'"
				
			}
		}

       

	    stage('Trigger ManifestUpdate') {
            steps {
                echo "triggering updatemanifestjob"
                build job: 'mlops-updatemanifest', parameters: [string(name: 'DOCKERTAG', value: env.BUILD_NUMBER)]


            }
        }
}
}