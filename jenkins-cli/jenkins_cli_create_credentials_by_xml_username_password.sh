#!/bin/bash

function create_credentials_by_xml_username_password() {
    echo """<com.cloudbees.plugins.credentials.impl.UsernamePasswordCredentialsImpl>
    <scope>GLOBAL</scope>
    <id>${JENKINS_CREDENTIAL_NAME}_USERNAME</id>
    <description>${JENKINS_CREDENTIAL_NAME}_USERNAME</description>
    <username>USUARIO</username>
    <password>SENHA</password>                                                                                                            
</com.cloudbees.plugins.credentials.impl.UsernamePasswordCredentialsImpl>""" | \
    java \
        -jar jenkins-cli.jar \
        -s $JENKINS_URL \
        create-credentials-by-xml \
        $JENKINS_CREDENTIAL_STORE \
        $JENKINS_CREDENTIAL_DOMAIN
}

