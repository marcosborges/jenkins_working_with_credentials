#!/bin/bash

function update_credentials_by_xml_basic_ssh_user_private_key() {
    echo """<com.cloudbees.jenkins.plugins.sshcredentials.impl.BasicSSHUserPrivateKey plugin=\"ssh-credentials@1.13\"> 
    <scope>GLOBAL</scope> 
    <id>${JENKINS_CREDENTIAL_NAME}_SSH</id> 
    <description>${JENKINS_CREDENTIAL_NAME}_SSH</description> 
    <username>USUARIO</username> 
    <privateKeySource class=\"com.cloudbees.jenkins.plugins.sshcredentials.impl.BasicSSHUserPrivateKey\$DirectEntryPrivateKeySource\"> 
        <privateKey>-----BEGIN RSA PRIVATE KEY----- 
MIIEpAIBAAKCAQEAuXPQR+kYowJ/pDvjlF7+HJ93eaIuQM/cQijmP8My3dGvEozh 
yWWktYfevPu05rda1ThNHNKXjs6Kynl7tl3Sp0vuCF8CXAnyvleimCvip4P4uW28  
-----END RSA PRIVATE KEY----- </privateKey> 
    </privateKeySource> 
</com.cloudbees.jenkins.plugins.sshcredentials.impl.BasicSSHUserPrivateKey>""" | \
    java \
        -jar jenkins-cli.jar \
        -s $JENKINS_URL \
        update-credentials-by-xml \
        $JENKINS_CREDENTIAL_STORE \
        $JENKINS_CREDENTIAL_DOMAIN \
        ${JENKINS_CREDENTIAL_NAME}_SSH
}