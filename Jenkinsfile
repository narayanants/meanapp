/*Jenkins file for Simple MEAN Application*/

pipeline {
    environment {
        registry = "narayanants/meanapp"
        registryCredential = 'dockerhub'
        dockerImage = ''
    }


    agent any

    stages {

        stage('Clone repository') {
            steps {
                checkout scm
            }
        }

        stage('Build image') {
            steps {
                script {

                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }

        stage('Push image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }


        stage('Pull image') {
            steps {
                script {
                    docker.withRegistry('', registryCredential) {
                        dockerImage.pull()
                    }
                }
            }
        }

        stage('Run Image'){
            steps{
                script {
                    sh 'docker run -d --rm -p 9000:5000 $registry:$BUILD_NUMBER'
                }
            }
        }
    }
}