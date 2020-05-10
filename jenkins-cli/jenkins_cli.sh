#!/bin/bash

export JENKINS_URL=http://localhost:8080
export JENKINS_USER_ID=marcos
export JENKINS_API_TOKEN=11a91767b5390bd10f078a981ed8fa6521
export JENKINS_CREDENTIAL_STORE="system::system::jenkins"
export JENKINS_CREDENTIAL_DOMAIN="(global)"
export JENKINS_CREDENTIAL_NAME="TEST"

#source jenkins-cli-help.sh
#help

source jenkins_cli_create_credentials_by_xml_string.sh
create_credentials_by_xml_string

source jenkins_cli_create_credentials_by_xml_username_password.sh
create_credentials_by_xml_username_password

source jenkins_cli_create_credentials_by_xml_filename.sh
create_credentials_by_xml_filename

source jenkins_cli_create_credentials_by_xml_basic_ssh_user_private_key.sh
create_credentials_by_xml_basic_ssh_user_private_key

#ATUALIZAR CREDENCIAL GLOBAL
# - String
# - File
# - UsernamePassword
# - SSH

#OBTER CREDENCIAL GLOBAL
# - String
# - File
# - UsernamePassword
# - SSH

#EXCLUIR CREDENCIAL GLOBAL
# - String
# - File
# - UsernamePassword
# - SSH









#echo "
####################################
## Obtendo uma credencial como xml #
####################################
#"
#java \
#    -jar jenkins-cli.jar \
#    -s $JENKINS_URL \
#    get-credentials-as-xml \
#    "system::system::jenkins" \
#    "(global)" \
#    "SLACK_TOKEN"
#echo -e "-----------------------\n\n\n"
#




#CRIAR DOMINIO CUSTOMIZADO

#ATUALIZAR DOMINIO CUSTOMIZADO

#CRIAR CREDENCIAL CUSTOMIZADO
# - String
# - File
# - UsernamePassword
# - SSH

#ATUALIZAR CREDENCIAL CUSTOMIZADO
# - String
# - File
# - UsernamePassword
# - SSH

#EXCLUIR CREDENCIAL CUSTOMIZADO
# - String
# - File
# - UsernamePassword
# - SSH

#EXCLUIR DOMINIO



