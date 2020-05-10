#!/bin/bash

export JENKINS_URL="http://localhost:8080"

# NUNCA SALVE SUAS CREDENCIAIS EM ARQUIVOS VERSIONADOS NO GIT, 
# FAZER ISSO É UM MAL EXEMPLO, SEMPRE UTILIZE COFRE DE SENHAS.
# ESTOU FAZENDO ISSO COM "DIREITO POÉTICO" POR SER UM DEMO.
export JENKINS_USER_ID="marcos"
export JENKINS_API_TOKEN="11a91767b5390bd10f078a981ed8fa6521"

#(STORE=Provider::Resolver::ContextPath)
export JENKINS_CREDENTIAL_NAME="TEST"
export JENKINS_CREDENTIAL_FOLDER_NAME="FOLDER_A"
export JENKINS_CREDENTIAL_STORE="system::system::jenkins"
export JENKINS_CREDENTIAL_FOLDER_STORE="folder::item::/${JENKINS_CREDENTIAL_FOLDER_NAME}"
export JENKINS_CREDENTIAL_DOMAIN="(global)"

#source jenkins-cli-help.sh
#help

echo "
###################################################################
# EXECUTANDO EXEMPLO PARA CRIAÇÂO DE CREDENCIAIS GLOBAIS POR XML  #
###################################################################
"

echo -e "\n\n# ---------------CRIANDO AS CREDENCIAIS-----------------#"

echo "[*] Criando uma credencial do tipo texto"
source jenkins_cli_create_credentials_by_xml_string.sh
create_credentials_by_xml_string
echo "[*] Criando uma credencial do tipo usuário e senha"
source jenkins_cli_create_credentials_by_xml_username_password.sh
create_credentials_by_xml_username_password
echo "[*] Criando uma credencial do tipo arquivo"
source jenkins_cli_create_credentials_by_xml_filename.sh
create_credentials_by_xml_filename
echo "[*] Criando uma credencial do tipo chave privada ssh"
source jenkins_cli_create_credentials_by_xml_basic_ssh_user_private_key.sh
create_credentials_by_xml_basic_ssh_user_private_key

echo -e "\n\n# ---------------ATUALIZAR CREDENCIAIS-----------------#"

echo "[*] Atualizando a credencial do tipo texto"
source jenkins_cli_update_credentials_by_xml_string.sh
update_credentials_by_xml_string
echo "[*] Atualizando a credencial do tipo usuário e senha"
source jenkins_cli_update_credentials_by_xml_username_password.sh
update_credentials_by_xml_username_password
echo "[*] Atualizando a credencial do tipo arquivo"
source jenkins_cli_update_credentials_by_xml_filename.sh
update_credentials_by_xml_filename
echo "[*] Atualizando a credencial do tipo chave privada ssh"
source jenkins_cli_update_credentials_by_xml_basic_ssh_user_private_key.sh
update_credentials_by_xml_basic_ssh_user_private_key

echo -e "\n\n# ---------------LISTAR CREDENCIAIS-----------------#"


echo "[*] Listando todas as credenciais cadastradas"
source jenkins_cli_list_credentials.sh
list_credentials

echo -e "\n\n# ---------------OBTER CREDENCIAL GLOBAL-----------------#"

echo "[*] Obtendo a credencial do tipo texto como xml"
source jenkins_cli_get_credentials_as_xml_string.sh
get_credentials_as_xml_string
echo "---"
echo "[*] Obtendo a credencial do tipo usuário e senha como xml"
source jenkins_cli_get_credentials_as_xml_username_password.sh
get_credentials_as_xml_username_password
echo "---"
echo "[*] Obtendo a credencial do tipo arquivo como xml"
source jenkins_cli_get_credentials_as_xml_filename.sh
get_credentials_as_xml_filename
echo "---"
echo "[*] Obtendo a credencial do tipo chave privada ssh como xml"
source jenkins_cli_get_credentials_as_xml_basic_ssh_user_private_key.sh
get_credentials_as_xml_basic_ssh_user_private_key
echo "---"

echo -e "\n\n# ---------------EXCLUIR CREDENCIAL GLOBAL-----------------#"

echo "[*] Excluindo a credencial do tipo texto"
source jenkins_cli_delete_credentials_string.sh
delete_credentials_string
echo "[*] Excluindo a credencial do tipo usuário e senha"
source jenkins_cli_delete_credentials_username_password.sh
delete_credentials_username_password
echo "[*] Excluindo a credencial do tipo arquivo"
source jenkins_cli_delete_credentials_filename.sh
delete_credentials_filename
echo "[*] Excluindo a credencial do tipo chave privada ssh"
source jenkins_cli_delete_credentials_basic_ssh_user_private_key.sh
delete_credentials_basic_ssh_user_private_key

echo "
######################################################################
# EXECUTANDO EXEMPLO PARA CRIAÇÂO DE CREDENCIAIS SOB PASTAS POR XML  #
######################################################################
"

echo -e "\n\n# ---------------CRIANDO PASTA-----------------#"

echo "[*] Criando a pasta FOLDER_A"
source jenkins_cli_create_folder.sh
create_folder

echo -e "\n\n# --------CRIANDO CREDENCIAL SOB PASTA---------#"

echo "[*] Criando a credencial do tipo texto na pasta FOLDER_A"
source jenkins_cli_folder_create_credentials_by_xml_string.sh
folder_create_credentials_by_xml_string

echo -e "\n\n# ------ATUALIZANDO CREDENCIAL SOB PASTA-------#"

echo "[*] Atualizando a credencial do tipo texto na pasta FOLDER_A"
source jenkins_cli_folder_update_credentials_by_xml_string.sh
folder_update_credentials_by_xml_string

echo -e "\n\n# -------LISTANDO CREDENCIAIS SOB PASTA--------#"

echo "[*] Listando a credencial do tipo texto na pasta FOLDER_A"
source jenkins_cli_folder_list_credentials_string.sh
folder_list_credentials_string

echo -e "\n\n# --------OBTENDO CREDENCIAL SOB PASTA---------#"

echo "[*] Obtendo a credencial do tipo texto na pasta FOLDER_A"
source jenkins_cli_folder_get_credentials_string.sh
folder_get_credentials_string

echo -e "\n\n# -------EXCLUINDO CREDENCIAL SOB PASTA--------#"

echo "[*] Excluindo a credencial do tipo texto na pasta FOLDER_A"
source jenkins_cli_folder_delete_credentials_string.sh
folder_delete_credentials_string

echo -e "\n\n# --------------EXCLUINDO PASTA----------------#"

echo "[*] Excluindo a pasta FOLDER_A"
source jenkins_cli_delete_folder.sh
delete_folder