pipeline{
agent any
    environment{
			DOCKER_HUB_REPO = "vijaya81kp/capterrapp"
			REGISTRY_CREDENTIAL = "dockerhub"
			CONTAINER_NAME = "captflaskcontainer"
			dockerImage = ''
			PATH = "/usr/local/bin/terraform:$PATH"
			SECRET_FILE_ID = credentials('cptfvarfile')
	}
	tools {
        terraform 'terraform'
    }
	stages{
		stage('Clean'){
			steps{
				script{
					sh 'rm -rf $PWD/captflask'
					echo 'inside project clean'
					}
				}
		}
	
	stage('SVM-Checkout'){
			steps{
				script{
					sh 'git clone https://github.com/srinanpravij/capterraform.git $PWD/captflask'
					sh 'ls'
					}
				}
		}
	stage('Build Image') {
			steps {
				script {
					sh 'env'
					sh 'pwd'
					// Building new image
					//sh 'docker image build -t $DOCKER_HUB_REPO:latest .'
					sh 'docker image build . -f ./captflask/Dockerfile -t vijaya81kp/capterrapp'
					sh 'docker image tag $DOCKER_HUB_REPO:latest $DOCKER_HUB_REPO:$BUILD_NUMBER'
					// Pushing Image to Repository
					docker.withRegistry( '', REGISTRY_CREDENTIAL ) {	
					sh 'docker push vijaya81kp/capterrapp:$BUILD_NUMBER'
					sh 'docker push vijaya81kp/capterrapp:latest'
					}

					echo "Image built and pushed to repository"
				}
			}
		}
		stage('Terraform Init'){
            steps {
                // Initialize terraform with all the required plugin
                sh 'pwd'
                script{
                      dir('captflask'){
                      sh 'terraform init'
                       }
                    }
				}
        }
        stage('Terraform apply'){
            steps {
                // Initialize terraform with all the required plugin
                sh 'env'
                sh 'pwd'
                script{
                dir('captflask'){
                sh 'terraform apply -var-file=${SECRET_FILE_ID} --auto-approve'
                                }
                    }
            }
        }
	}
}
