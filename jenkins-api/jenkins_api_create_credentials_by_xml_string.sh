#!/bin/bash

function create_credentials_by_xml_string() {
    
    #CSRF Protection
    COOKIEJAR="$(mktemp)"
    CRUMB=$(curl -s -u "$JENKINS_USER_ID:$JENKINS_API_TOKEN" --cookie-jar "$COOKIEJAR" "$JENKINS_URL/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,%22:%22,//crumb)")
 
    echo """<org.jenkinsci.plugins.plaincredentials.impl.StringCredentialsImpl plugin=\"plain-credentials@1.7\">
        <scope>GLOBAL</scope>
        <id>${JENKINS_CREDENTIAL_NAME}_STRING3</id>
        <description>${JENKINS_CREDENTIAL_NAME}_STRING3</description>
        <secret>SENHA</secret>
    </org.jenkinsci.plugins.plaincredentials.impl.StringCredentialsImpl>""" > credential_string.xml
    
    curl -X POST \
        -s \
        -u $JENKINS_USER_ID:$JENKINS_API_TOKEN \
        --cookie "$COOKIEJAR" \
        -H $CRUMB \
        -H 'content-type:application/xml' \
        -d @credential_string.xml \
        "$JENKINS_URL/credentials/store/system/domain/_/createCredentials"
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