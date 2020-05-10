#!/bin/bash

function list_credentials() {
    java \
        -jar jenkins-cli.jar \
        -s $JENKINS_URL \
        list-credentials \
        $JENKINS_CREDENTIAL_STORE \
        $JENKINS_CREDENTIAL_DOMAIN
}