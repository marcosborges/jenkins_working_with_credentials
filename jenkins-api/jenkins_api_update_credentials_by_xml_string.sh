#!/bin/bash

function update_credentials_by_xml_string() {
    
    #CSRF Protection
    COOKIEJAR="$(mktemp)"
    CRUMB=$(curl -s -u "$JENKINS_USER_ID:$JENKINS_API_TOKEN" --cookie-jar "$COOKIEJAR" "$JENKINS_URL/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,%22:%22,//crumb)")
 
    echo """<org.jenkinsci.plugins.plaincredentials.impl.StringCredentialsImpl plugin=\"plain-credentials@1.7\">
        <scope>GLOBAL</scope>
        <id>${JENKINS_CREDENTIAL_NAME}_STRING</id>
        <description>${JENKINS_CREDENTIAL_NAME}_STRING</description>
        <secret>SENHA</secret>
    </org.jenkinsci.plugins.plaincredentials.impl.StringCredentialsImpl>""" > credential_string.xml
    
    curl -X POST \
        -s \
        -u $JENKINS_USER_ID:$JENKINS_API_TOKEN \
        --cookie "$COOKIEJAR" \
        -H $CRUMB \
        -H 'content-type:application/xml' \
        -d @credential_string.xml \
        "$JENKINS_URL/credentials/${JENKINS_CREDENTIAL_STORE}/credential/${JENKINS_CREDENTIAL_NAME}_STRING/config.xml"
}