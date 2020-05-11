node {
    stage ( 'Stage 1' ) {
        withCredentials([
            string(credentialsId: 'API_HOST', variable: "API_HOST"),
            string(credentialsId: 'API_KEY', variable: "API_KEY")
        ]){
            sh """curl -H "Authorization: ${env.API_KEY}" ${env.API_HOST}/api """
        }
    }
}