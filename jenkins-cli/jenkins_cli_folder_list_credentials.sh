#!/bin/bash

function folder_list_credentials() {
    java \
        -jar jenkins-cli.jar \
        -s $JENKINS_URL \
        list-credentials \
        $JENKINS_CREDENTIAL_FOLDER_STORE
}