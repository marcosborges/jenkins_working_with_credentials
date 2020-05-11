    def name = "TEST_GRV"
    def desc = "TEST_GRV"
        
    def create_credentials_username_password() {
        Jenkins.getInstance()
            .getExtensionList('com.cloudbees.plugins.credentials.SystemCredentialsProvider')
            .first()
            .getStore()
            .addCredentials(
                Domain.global(), 
                new StringCredentialsImpl(
                    CredentialsScope.GLOBAL,
                    "${name}_STRING",
                    "${desc}_STRING",
                    Secret.fromString("SEGREDO")
                )
            )
    }