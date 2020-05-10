echo "
######################################
# Listando os provedores (Providers) #
######################################
"
java \
    -jar jenkins-cli.jar \
    -s $JENKINS_URL \
    list-credentials-providers 
echo -e "-----------------------\n\n\n"
