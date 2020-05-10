#!/bin/bash

function create_credentials_by_xml_string() {
    echo """<org.jenkinsci.plugins.plaincredentials.impl.StringCredentialsImpl plugin=\"plain-credentials@1.7\">
        <scope>GLOBAL</scope>
        <id>${JENKINS_CREDENTIAL_NAME}_STRING</id>
        <description>${JENKINS_CREDENTIAL_NAME}_STRING</description>
        <secret>SENHA</secret>
    </org.jenkinsci.plugins.plaincredentials.impl.StringCredentialsImpl>""" | \
    java \
        -jar jenkins-cli.jar \
        -s $JENKINS_URL \
        create-credentials-by-xml \
        $JENKINS_CREDENTIAL_STORE \
        $JENKINS_CREDENTIAL_DOMAIN
}

