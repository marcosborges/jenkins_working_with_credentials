#https://stackoverflow.com/questions/42959209/determine-store-id-for-a-folder-to-use-cli-to-upload-and-list-credentials
echo "
###############################################################################
# Listando as credenciais por armazem Provider::Resolver::ContextPath (store) #
# store ex.: Provider::Resolver::ContextPath                                  #
###############################################################################
"
java \
    -jar jenkins-cli.jar \
    -s $JENKINS_URL \
    list-credentials \
    "system::system::jenkins" 
echo -e "-----------------------\n\n\n"
