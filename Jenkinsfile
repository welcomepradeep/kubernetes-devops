pipeline {

    agent any

    environment {

        DOCKER_IMAGE =
            "pradeepnayak07/kubernetes-devops-platform"

        IMAGE_TAG =
            "${BUILD_NUMBER}"

        K8S_NAMESPACE =
            "devops"

        HELM_RELEASE =
            "devops-cicd"

    }

    stages {

        stage('Checkout') {

            steps {

                checkout scm

            }

        }


        stage('Test') {

            steps {

                sh '''
                    echo "Running application tests"

                    test -f application/index.html

                    test -f application/Dockerfile

                    echo "Tests passed"
                '''

            }

        }


        stage('Docker Build') {

            steps {

                sh """

                    docker build \
                    -t ${DOCKER_IMAGE}:${IMAGE_TAG} \
                    application

                """

            }

        }


        stage('Docker Login') {

            steps {

                withCredentials([

                    usernamePassword(

                        credentialsId: 'dockerhub',

                        usernameVariable: 'DOCKER_USER',

                        passwordVariable: 'DOCKER_PASS'

                    )

                ]) {

                    sh '''

                        echo "$DOCKER_PASS" |

                        docker login \
                        -u "$DOCKER_USER" \
                        --password-stdin

                    '''

                }

            }

        }


        stage('Docker Push') {

            steps {

                sh """

                    docker push \
                    ${DOCKER_IMAGE}:${IMAGE_TAG}

                """

            }

        }


        stage('Helm Deploy') {

            steps {

                sh """

                    helm upgrade --install \
                    ${HELM_RELEASE} \
                    helm/devops-cicd \
                    --namespace ${K8S_NAMESPACE} \
                    --create-namespace \
                    --set image.repository=${DOCKER_IMAGE} \
                    --set image.tag=${IMAGE_TAG}

                """

            }

        }


        stage('Verify Deployment') {

            steps {

                sh """

                    kubectl rollout status \
                    deployment/${HELM_RELEASE} \
                    -n ${K8S_NAMESPACE} \
                    --timeout=180s

                """

            }

        }


        stage('Health Check') {

            steps {

                sh '''

                    kubectl get pods \
                    -n devops

                    kubectl get service \
                    -n devops

                    kubectl get ingress \
                    -n devops

                '''

            }

        }

    }


    post {

        success {

            echo "=================================="

            echo "Kubernetes Deployment Successful"

            echo "=================================="

        }

        failure {

            echo "Kubernetes Deployment Failed"

        }

        always {

            cleanWs()

        }

    }

}
