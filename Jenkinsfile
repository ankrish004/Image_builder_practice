pipeline{
    agent any

    environment {
        IMAGE_TAG = "${BUILD_NUMBER}"
        IMAGE_NAME = 'testapp'
        DOCKERHUB_CREDENTIALS = credentials('ankrish-docker')

    }
    stages{
 

        stage("git checkout stage") {
            steps {
                git branch: 'master',
                    url: 'https://github.com/ankrish004/Image_builder_practice',
                    credentialsId: 'GIT_CRED'
            }
        }

        stage('image build') {

            steps{
                sh'''
                    echo "$DOCKERHUB_CREDENTIALS_PSW" | docker login -u "$DOCKERHUB_CREDENTIALS_USR" --password-stdin
                    docker build -t ankrish/$IMAGE_NAME:${BUILD_NUMBER} .
                    echo "yeq!!"
               
                '''
            }
        }

        stage('Pushing to hub') { 
            steps{
                sh'''
                 echo "pushing the image to docker hub"
                 docker push ankrish/$IMAGE_NAME:${BUILD_NUMBER}
                 echo "pushed"
                '''
            }
        }  
        stage{
            steps{
                withCredentials([usernameColonPassword(credentialsId: 'GIT_CRED', variable: 'GIT_CRED')]) {
                    sh'''
                    cat deployment.yaml
                    sed -i "s|ankrish/testapp:.*|ankrish/testapp:${BUILD_NUMBER}|g" deployment.yaml
                    git commit -m 'Updated the deploy yaml | Jenkins Pipeline'
                    git remote -v
                    git push https://github.com/ankrish004/Image_builder_practice.git


                    '''
                }
            }
        }
    }

}