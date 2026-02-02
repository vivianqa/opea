*** Variables ***

#Cadastro
${URL_CADASTRO}          https://sso.opea-uat.solutions/account/signup
${BROWSER}               chrome

${NOME_COMPLETO_VALIDO}
${CPF_VALIDO}            
${EMAIL_VALIDO}
${EMAIL_EXISTENTE}  avaliacao_qa@opea.com.br       
${TELEFONE_VALIDO}
${EMPRESA_VALIDA}        
${SENHA_VALIDA}          
${CONFIRMA_SENHA_VALIDA}

#Acesso
${URL_ACESSO}       https://sso.opea-uat.solutions/realms/opea/protocol/openid-connect/auth?approval_prompt=force&client_id=oauth2-proxy&redirect_uri=https%3A%2F%2Fauth.opea-uat.solutions%2Foauth2%2Fcallback&response_type=code&scope=openid+email+profile&state=gM-Gz_sUsaQeXNRZSCNpxIHTC5ry3AYw2rp7NpkwfcI%3Ahttps%3A%2F%2Fsso.opea-uat.solutions%2Faccount%2F

${CPF_EXISTENTE}    96932771047

${EMAIL_INVALIDO_FORMATO}    invalidemail.com
${CPF_INVALIDO_FORMATO}  12345678900
${SENHA_INVALIDA}               senha,123  # Exemplo de senha que não atende aos critérios
${CONFIRMA_SENHA_INVALIDA}      senha,123  # Exemplo de senha que não atende aos critérios

${EMAIL_ACESSO}    mogal72595@fogdiver.com
${SENHA_ACESSO}    Autentic@007

${BOTAO_GO_BACK}     xpath=//button[contains(@class, 'is-danger') and contains(text(), 'Go back')]
${BOTAO_SIGN_IN}     xpath=//button[contains(@class, 'is-primary') and contains(text(), 'Sign in')]
${TEXTO_AUTHENTICADO}    Authenticated

${CAMPO_EMAIL_LOGIN}    id=username    
${CAMPO_SENHA_LOGIN}    id=password
${BOTAO_ENTRAR}         xpath=//input[@id='kc-login']

#Mensagens
${MSG_REENVIO_SUCESSO}    E-mail enviado com sucesso.
${MENSAGEM_ERRO_LOGIN}    xpath=//span[@id='input-error' and contains(text(), 'Nome de usuário ou senha inválida')]

${CODIGO_ERRO_403}     xpath=//div[@class="status-code" and normalize-space()="403"]
${TITULO_ERRO_403}     xpath=//h1[contains(normalize-space(), "Forbidden")]

${MENSAGEM_ERRO_LOCATOR_EMAIL}    xpath=//span[@id='input-error' and contains(text(), 'Nome de usuário ou senha inválida')]
${MENSAGEM_ERRO_LOCATOR_SENHA}    xpath=//span[@id='input-error' and contains(text(), 'Nome de usuário ou senha inválida')]

${BOTAO_ESQUECEU_SENHA}    css:a[href*="reset-credentials"]
${BOTAO_CONFIRMAR}    xpath=//input[@type='submit' and @value='Confirmar']

${ELEMENTO_MENSAGEM_SUCESSO}    css=span.pf-c-alert__title.kc-feedback-text

