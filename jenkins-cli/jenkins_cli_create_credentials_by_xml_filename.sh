#!/bin/bash

function create_credentials_by_xml_filename() {
    echo """<org.jenkinsci.plugins.plaincredentials.impl.FileCredentialsImpl plugin=\"plain-credentials@1.4\">
   <scope>GLOBAL</scope>
   <id>${JENKINS_CREDENTIAL_NAME}_FILE</id>
   <description>${JENKINS_CREDENTIAL_NAME}_FILE</description>
   <fileName>secret.txt</fileName>
   <secretBytes>123456789</secretBytes>
</org.jenkinsci.plugins.plaincredentials.impl.FileCredentialsImpl>""" | \
    java \
        -jar jenkins-cli.jar \
        -s $JENKINS_URL \
        create-credentials-by-xml \
        $JENKINS_CREDENTIAL_STORE \
        $JENKINS_CREDENTIAL_DOMAIN
}

