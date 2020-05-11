    def name = "TEST_GRV"
    def desc = "TEST_GRV"
        
    
    def create_credentials_filename(){
        def filename = "/etc/hosts"
        def path = Paths.get(filename)
        def secretBytes = SecretBytes.fromBytes(Files.readAllBytes(path))
        Jenkins.getInstance()
            .getExtensionList('com.cloudbees.plugins.credentials.SystemCredentialsProvider')
            .first()
            .getStore()
            .addCredentials( 
                Domain.global(),
                new FileCredentialsImpl(
                    CredentialsScope.GLOBAL,
                    "${name}_FILE",
                    "${desc}_FILE",
                    "${path.getFileName()}".toString(),
                    secretBytes
                )
            )
    }

    def create_credentials_filename_by_content(){
        def filename = "/etc/hosts"
        def path = Paths.get(filename)
        def secretBytes = SecretBytes.fromBytes(Files.readAllBytes(path))
        Jenkins.getInstance()
            .getExtensionList('com.cloudbees.plugins.credentials.SystemCredentialsProvider')
            .first()
            .getStore()
            .addCredentials( 
                Domain.global(),
                new FileCredentialsImpl(
                    CredentialsScope.GLOBAL,
                    "${name}_CONTENT_FILE",
                    "${desc}_CONTENT_FILE",
                    "${path.getFileName()}".toString(),
                    secretBytes
                )
            )
    }