#!/bin/bash

function get_credentials_as_xml_username_password() {
    java \
        -jar jenkins-cli.jar \
        -s $JENKINS_URL \
        get-credentials-as-xml \
        $JENKINS_CREDENTIAL_STORE \
        $JENKINS_CREDENTIAL_DOMAIN \
        ${JENKINS_CREDENTIAL_NAME}_USERNAME
}

