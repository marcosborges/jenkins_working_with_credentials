#!/bin/bash

function create_credentials_by_xml_username_password() {
    #CSRF Protection
    COOKIEJAR="$(mktemp)"
    CRUMB=$(curl -s -u "$JENKINS_USER_ID:$JENKINS_API_TOKEN" --cookie-jar "$COOKIEJAR" "$JENKINS_URL/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,%22:%22,//crumb)")
    echo """<com.cloudbees.plugins.credentials.impl.UsernamePasswordCredentialsImpl>
        <scope>GLOBAL</scope>
        <id>${JENKINS_CREDENTIAL_NAME}_USERNAME</id>
        <description>${JENKINS_CREDENTIAL_NAME}_USERNAME</description>
        <username>USUARIO</username>
        <password>SENHA</password>                                                                                                            
    </com.cloudbees.plugins.credentials.impl.UsernamePasswordCredentialsImpl>""" > credential_username.xml
    
    curl -X POST \
        -s \
        -u $JENKINS_USER_ID:$JENKINS_API_TOKEN \
        --cookie "$COOKIEJAR" \
        -H $CRUMB \
        -H 'content-type:application/xml' \
        -d @credential_username.xml \
        "$JENKINS_URL/credentials/${JENKINS_CREDENTIAL_STORE}/createCredentials"
}