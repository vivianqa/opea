*** Variables ***
#Cadastro
${CAMPO_NOME_COMPLETO}     name=userName
${CAMPO_CPF}               name=userDocument
${CAMPO_EMAIL}             name=userEmail
${CAMPO_TELEFONE}          name=userPhone
${CAMPO_EMPRESA}           name=userCompany
${CAMPO_SENHA}             name=userPassword
${CAMPO_CONFIRMAR_SENHA}   name=userConfirmPassword
${BOTAO_CADASTRAR}         xpath=//button[span[contains(text(),'Cadastre-se')]]
${ELEMENTO_HOME}           name=home-page

#Acesso

${CAMPO_EMAIL_LOGIN}     id=username
${CAMPO_SENHA_LOGIN}     id=password
${BOTAO_ENTRAR}          xpath=//input[@id='kc-login']


