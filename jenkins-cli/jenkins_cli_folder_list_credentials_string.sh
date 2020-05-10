#!/bin/bash

function folder_list_credentials_string() {
    java \
        -jar jenkins-cli.jar \
        -s $JENKINS_URL \
        list-credentials \
        $JENKINS_CREDENTIAL_FOLDER_STORE
}