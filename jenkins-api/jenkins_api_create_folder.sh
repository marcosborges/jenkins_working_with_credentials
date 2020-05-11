#!/bin/bash

function create_folder() {

    echo """<?xml version='1.1' encoding='UTF-8'?>
        <com.cloudbees.hudson.plugins.folder.Folder plugin=\"cloudbees-folder@6.12\">
        <actions/>
        <description></description>
        <properties>
            <org.jenkinsci.plugins.docker.workflow.declarative.FolderConfig plugin=\"docker-workflow@1.23\">
            <dockerLabel></dockerLabel>
            <registry plugin=\"docker-commons@1.16\"/>
            </org.jenkinsci.plugins.docker.workflow.declarative.FolderConfig>
            <com.cloudbees.hudson.plugins.folder.properties.FolderCredentialsProvider_-FolderCredentialsProperty>
            <domainCredentialsMap class=\"hudson.util.CopyOnWriteMap\$Hash\">
                <entry>
                <com.cloudbees.plugins.credentials.domains.Domain plugin=\"credentials@2.3.7\">
                    <specifications/>
                </com.cloudbees.plugins.credentials.domains.Domain>
                <java.util.concurrent.CopyOnWriteArrayList/>
                </entry>
            </domainCredentialsMap>
            </com.cloudbees.hudson.plugins.folder.properties.FolderCredentialsProvider_-FolderCredentialsProperty>
        </properties>
        <folderViews class=\"com.cloudbees.hudson.plugins.folder.views.DefaultFolderViewHolder\">
            <views>
            <hudson.model.AllView>
                <owner class=\"com.cloudbees.hudson.plugins.folder.Folder\" reference=\"../../../..\"/>
                <name>All</name>
                <filterExecutors>false</filterExecutors>
                <filterQueue>false</filterQueue>
                <properties class=\"hudson.model.View\$PropertyList\"/>
            </hudson.model.AllView>
            </views>
            <tabBar class=\"hudson.views.DefaultViewsTabBar\"/>
        </folderViews>
        <healthMetrics>
            <com.cloudbees.hudson.plugins.folder.health.WorstChildHealthMetric>
            <nonRecursive>false</nonRecursive>
            </com.cloudbees.hudson.plugins.folder.health.WorstChildHealthMetric>
        </healthMetrics>
        <icon class=\"com.cloudbees.hudson.plugins.folder.icons.StockFolderIcon\"/>
        </com.cloudbees.hudson.plugins.folder.Folder>""" > job_folder.xml
    
    #CSRF Protection
    COOKIEJAR="$(mktemp)"
    CRUMB=$(curl -s -u "$JENKINS_USER_ID:$JENKINS_API_TOKEN" --cookie-jar "$COOKIEJAR" "$JENKINS_URL/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,%22:%22,//crumb)")
 
    curl -X POST \
        -s \
        -u $JENKINS_USER_ID:$JENKINS_API_TOKEN \
        --cookie "$COOKIEJAR" \
        -H $CRUMB \
        -H 'content-type:application/xml' \
        -d @job_folder.xml \
        "$JENKINS_URL/createItem?name=${JENKINS_CREDENTIAL_FOLDER_NAME}"
}