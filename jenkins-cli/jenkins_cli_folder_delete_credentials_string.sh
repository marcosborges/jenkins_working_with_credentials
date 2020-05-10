#!/bin/bash

function folder_delete_credentials_string() {
    java \
        -jar jenkins-cli.jar \
        -s $JENKINS_URL \
        delete-credentials \
        $JENKINS_CREDENTIAL_FOLDER_STORE \
        $JENKINS_CREDENTIAL_DOMAIN \
        "${JENKINS_CREDENTIAL_NAME}_STRING"
}

