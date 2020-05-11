#!/bin/bash

function create_credentials_by_xml_basic_ssh_user_private_key() {
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
        "$JENKINS_URL/credentials/${JENKINS_CREDENTIAL_STORE}/createCredentials"
}

#"$JENKINS_URL/job/top-folder/job/sub-folder/credentials/store/folder/domain/_/createCredentials"

#curl -X POST \
#    -u $JENKINS_USER:$JENKINS_PASSWORD_OR_API_TOKEN \
#    -H "Jenkins-Crumb:${JENKINS_CRUMB}" \
#    -H 'content-type:application/xml' \
#    -d @credential.xml \
#    "$JENKINS_URL/job/top-folder/job/sub-folder/credentials/store/folder/domain/_/createCredentials"
#
#
#curl -X GET \
#    -u $JENKINS_USER:$JENKINS_PASSWORD_OR_API_TOKEN \
#    -H "Jenkins-Crumb:${JENKINS_CRUMB}" \
#    "$JENKINS_URL/job/top-folder/job/sub-folder/credentials/store/folder/domain/_/credential/my-credentials-example-id/config.xml"
#
#
#curl -X POST \
#    -u $JENKINS_USER:$JENKINS_PASSWORD_OR_API_TOKEN \
#    -H "Jenkins-Crumb:${JENKINS_CRUMB}" \
#    -H 'content-type:application/xml' \
#    -d @updatedCredential.xml \
#    "$JENKINS_URL/job/top-folder/job/sub-folder/credentials/store/folder/domain/_/credential/my-credentials-example-id/config.xml"
#
#
#curl -X DELETE \
#    -u $JENKINS_USER:$JENKINS_PASSWORD_OR_API_TOKEN \
#    -H "Jenkins-Crumb:${JENKINS_CRUMB}" \
#    "$JENKINS_URL/job/top-folder/job/sub-folder/credentials/store/folder/domain/_/credential/my-credentials-example-id/config.xml"