#!/bin/bash

function update_credentials_by_xml_filename() {
    #CSRF Protection
    COOKIEJAR="$(mktemp)"
    CRUMB=$(curl -s -u "$JENKINS_USER_ID:$JENKINS_API_TOKEN" --cookie-jar "$COOKIEJAR" "$JENKINS_URL/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,%22:%22,//crumb)")
    echo """<org.jenkinsci.plugins.plaincredentials.impl.FileCredentialsImpl plugin=\"plain-credentials@1.4\">
        <scope>GLOBAL</scope>
        <id>${JENKINS_CREDENTIAL_NAME}_FILE</id>
        <description>${JENKINS_CREDENTIAL_NAME}_FILE</description>
        <fileName>secret.txt</fileName>
        <secretBytes>123456789</secretBytes>
    </org.jenkinsci.plugins.plaincredentials.impl.FileCredentialsImpl>""" > credential_file.xml
    
    curl -X POST \
        -s \
        -u $JENKINS_USER_ID:$JENKINS_API_TOKEN \
        --cookie "$COOKIEJAR" \
        -H $CRUMB \
        -H 'content-type:application/xml' \
        -d @credential_file.xml \
        "$JENKINS_URL/credentials/${JENKINS_CREDENTIAL_STORE}/credential/${JENKINS_CREDENTIAL_NAME}_FILE/config.xml"
}