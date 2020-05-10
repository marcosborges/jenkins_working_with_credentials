#!/bin/bash

function folder_get_credentials_string() {
    java \
        -jar jenkins-cli.jar \
        -s $JENKINS_URL \
        get-credentials-as-xml \
        $JENKINS_CREDENTIAL_FOLDER_STORE \
        $JENKINS_CREDENTIAL_DOMAIN \
        "${JENKINS_CREDENTIAL_NAME}_STRING"
}

