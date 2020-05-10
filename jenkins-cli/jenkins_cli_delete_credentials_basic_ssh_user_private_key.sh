#!/bin/bash

function delete_credentials_basic_ssh_user_private_key() {
    java \
        -jar jenkins-cli.jar \
        -s $JENKINS_URL \
        delete-credentials \
        $JENKINS_CREDENTIAL_STORE \
        $JENKINS_CREDENTIAL_DOMAIN \
        ${JENKINS_CREDENTIAL_NAME}_SSH
}

