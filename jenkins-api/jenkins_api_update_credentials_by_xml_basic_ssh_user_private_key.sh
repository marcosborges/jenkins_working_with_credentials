#!/bin/bash

function update_credentials_by_xml_basic_ssh_user_private_key() {
    #CSRF Protection
    COOKIEJAR="$(mktemp)"
    CRUMB=$(curl -s -u "$JENKINS_USER_ID:$JENKINS_API_TOKEN" --cookie-jar "$COOKIEJAR" "$JENKINS_URL/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,%22:%22,//crumb)")
    echo """<com.cloudbees.jenkins.plugins.sshcredentials.impl.BasicSSHUserPrivateKey plugin=\"ssh-credentials@1.13\"> 
        <scope>GLOBAL</scope> 
        <id>${JENKINS_CREDENTIAL_NAME}_SSH</id> 
        <description>${JENKINS_CREDENTIAL_NAME}_SSH</description> 
        <username>USUARIO</username> 
        <privateKeySource class=\"com.cloudbees.jenkins.plugins.sshcredentials.impl.BasicSSHUserPrivateKey\$DirectEntryPrivateKeySource\"> 
            <privateKey>
                -----BEGIN RSA PRIVATE KEY----- 
                -----END RSA PRIVATE KEY-----
            </privateKey> 
        </privateKeySource> 
    </com.cloudbees.jenkins.plugins.sshcredentials.impl.BasicSSHUserPrivateKey>""" > credential_ssh.xml
    
    curl -X POST \
        -s \
        -u $JENKINS_USER_ID:$JENKINS_API_TOKEN \
        --cookie "$COOKIEJAR" \
        -H $CRUMB \
        -H 'content-type:application/xml' \
        -d @credential_ssh.xml \
        "$JENKINS_URL/credentials/${JENKINS_CREDENTIAL_STORE}/credential/${JENKINS_CREDENTIAL_NAME}_SSH/config.xml"
}