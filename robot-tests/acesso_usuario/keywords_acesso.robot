*** Keywords ***
Abrir Pagina De Acesso
    Open Browser    ${URL_ACESSO}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${CAMPO_EMAIL_LOGIN}    15s
Preencher Campo Email
    [Arguments]    ${email}
    Input Text     ${CAMPO_EMAIL_LOGIN}    ${email}
Preencher Campo Senha
    [Arguments]    ${senha}
    Input Text     ${CAMPO_SENHA_LOGIN}    ${senha}
Preencher Campos Email e Senha Invalidos
    [Arguments]    ${email}    ${senha}
    Preencher Campo Email    ${email}
    Preencher Campo Senha    ${senha}
Validar Mensagem Erro Email Invalido
    Wait Until Element Is Visible    ${MENSAGEM_ERRO_LOCATOR_EMAIL}    10s
    Element Should Contain           ${MENSAGEM_ERRO_LOCATOR_EMAIL}    Nome de usuário ou senha inválida.
    Page Should Contain Element      ${BOTAO_ENTRAR}
Validar Mensagem Erro Senha Invalida
    Wait Until Element Is Visible    ${MENSAGEM_ERRO_LOCATOR_SENHA}    10s
    Element Should Contain           ${MENSAGEM_ERRO_LOCATOR_SENHA}    Nome de usuário ou senha inválida.
    Page Should Contain Element      ${BOTAO_ENTRAR}
Validar Mensagem Erro Dados Invalidos
    Wait Until Element Is Visible    ${MENSAGEM_ERRO_LOCATOR_EMAIL}    10s
    Element Should Contain           ${MENSAGEM_ERRO_LOCATOR_EMAIL}    Nome de usuário ou senha inválida.
    Wait Until Element Is Visible    ${MENSAGEM_ERRO_LOCATOR_SENHA}    10s
    Element Should Contain           ${MENSAGEM_ERRO_LOCATOR_SENHA}    Nome de usuário ou senha inválida.
    Page Should Contain Element      ${BOTAO_ENTRAR}
Clicar Em Esqueci Minha Senha
    Wait Until Element Is Visible    ${BOTAO_ESQUECEU_SENHA}    20s
    Scroll Element Into View    ${BOTAO_ESQUECEU_SENHA}   # Garante que o link está visível
    Click Link    ${BOTAO_ESQUECEU_SENHA}  # Usar "Click Link" para links <a>
Validar Envio De Email
...  Wait Until Page Contains    Um e-mail com instruções para a redefinição de sua senha foi enviado a você    10s
Clicar Em Confirmar
    Wait Until Element Is Visible    ${BOTAO_CONFIRMAR}    10s
    Click Button                     ${BOTAO_CONFIRMAR}
Validar Permaneceu Na Pagina De Login
    Page Should Contain Element    ${BOTAO_ENTRAR}
Clicar No Botao Entrar
    Wait Until Element Is Visible    ${BOTAO_ENTRAR}    10s
    Click Button    ${BOTAO_ENTRAR}
Validar Erro 403 Forbidden
    Wait Until Element Is Visible    ${CODIGO_ERRO_403}    15s
    Page Should Contain Element      ${TITULO_ERRO_403}
    Page Should Contain Element      ${BOTAO_GO_BACK}
    Page Should Contain Element      ${BOTAO_SIGN_IN}
    Log To Console    Tela de erro 403 exibida com sucesso.
Validar Tela Inicial
    Wait Until Element Is Visible    xpath=//h1[contains(text(), "Account")]    15s
    Page Should Contain Element      xpath=//h2[contains(text(), "Bem-vindo")]
    Page Should Contain Element      xpath=//label[contains(text(), "Nome")]
    Page Should Contain Element      xpath=//label[contains(text(), "Email")]
    Page Should Contain Element      xpath=//label[contains(text(), "Celular")]
    Page Should Contain Element      xpath=//h3[contains(text(), "Sistemas")]
    Page Should Contain             Portal da Opea
    Page Should Contain             Projeto de Exemplo da Opea
    Page Should Contain             Minha Conta
    Page Should Contain             Visualizador de Relatórios
    Page Should Contain             Sistema de IA
    Page Should Contain             Portal do Omni
    Log To Console    Tela inicial validada com sucesso.
Clicar No More Info
    Wait Until Element Is Visible    xpath=//a[contains(@class, 'card-toggle')]    10s
    Click Element    xpath=//a[contains(@class, 'card-toggle')]
Validar Mensagem CSRF Token
    Wait Until Page Contains    Login Failed: Unable to find a valid CSRF token. Please try again.    10s    
Clicar No Go Back Na Tela 403
    Click Button    ${BOTAO_GO_BACK}
Clicar No Sign In Na Tela 403
    Click Button    ${BOTAO_SIGN_IN}   
Validar Tela Autenticada
    Wait Until Page Contains Element    xpath=//pre[contains(text(), '${TEXTO_AUTHENTICADO}')]    10s
Encerrar Navegador
    Close Browser