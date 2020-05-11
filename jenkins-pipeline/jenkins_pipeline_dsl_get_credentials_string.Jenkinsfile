pipeline {
    agent any
    environment {
        API_HOST = credentials('API_HOST')
        API_KEY = credentials('API_KEY')
    }
    stages {
        stage ( 'Stage 1' ) {
            steps {
                script {
                    sh """curl -H "Authorization: ${env.API_KEY}" ${env.API_HOST}/api """
                }
            }
        }
    }
}