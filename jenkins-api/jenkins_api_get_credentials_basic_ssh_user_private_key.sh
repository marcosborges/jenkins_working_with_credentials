#!/bin/bash

function get_credentials_basic_ssh_user_private_key() {
    
    #CSRF Protection
    COOKIEJAR="$(mktemp)"
    CRUMB=$(curl -s -u "$JENKINS_USER_ID:$JENKINS_API_TOKEN" --cookie-jar "$COOKIEJAR" "$JENKINS_URL/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,%22:%22,//crumb)")
 
    curl -X GET \
        -s \
        -u $JENKINS_USER_ID:$JENKINS_API_TOKEN \
        --cookie "$COOKIEJAR" \
        -H $CRUMB \
        -H 'content-type:application/xml' \
        "$JENKINS_URL/credentials/${JENKINS_CREDENTIAL_STORE}/credential/${JENKINS_CREDENTIAL_NAME}_SSH/api/xml"
}