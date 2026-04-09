pipeline{
    agent any

    environment {
        IMAGE_TAG = "${BUILD_NUMBER}"
        IMAGE_NAME = 'testapp'

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
                '''
            }
        }  /* 
        stage{
            step{
                withCredentials([usernameColonPassword(credentialsId: 'GIT_CRED', variable: 'GIT_CRED')]) {
                    sh'''
                    cat deployment.yaml
                    sed sed -i "s/32/${BUILD_NUMBER}/g" deploy.yaml


                    '''
                }
            }
        }*/
    }

}