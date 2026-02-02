*** Settings ***
Documentation     Cenário: Acessos com e-mail e senha válidos
Library           SeleniumLibrary
Resource          ../resources/variables.robot
Resource          ../resources/locators.robot
Resource          keywords_acesso.robot
Library           String
Library           BuiltIn
Library           OperatingSystem

*** Test Cases ***
Acesso Com Email E Senha Validos
    [Tags]    acesso    positivo
    Abrir Pagina De Acesso
    Preencher Campo Email       ${EMAIL_ACESSO}
    Preencher Campo Senha       ${SENHA_ACESSO}
    Clicar No Botao Entrar
    Validar Erro 403 Forbidden
    Encerrar Navegador

Acesso Com Email E Senha Validos - Tela Inicial
    [Tags]    acesso    positivo
    Abrir Pagina De Acesso
    Preencher Campo Email       ${EMAIL_ACESSO}
    Preencher Campo Senha       ${SENHA_ACESSO}
    Clicar No Botao Entrar
    Validar Tela Inicial
    Encerrar Navegador

Clicar No More Info
    [Tags]    acesso    positivo
    Abrir Pagina De Acesso
    Preencher Campo Email       ${EMAIL_ACESSO}
    Preencher Campo Senha       ${SENHA_ACESSO}
    Clicar No Botao Entrar
    Clicar No More Info
    Validar Mensagem CSRF Token
    Encerrar Navegador
Clicar No Go Back Na Tela 403
    [Tags]    erro403    goback
    Abrir Pagina De Acesso
    Preencher Campo Email       ${EMAIL_ACESSO}
    Preencher Campo Senha       ${SENHA_ACESSO}
    Clicar No Botao Entrar
    Clicar No Go Back Na Tela 403
    Validar Tela Autenticada
    Encerrar Navegador

Clicar No Sign In Na Tela 403
    [Tags]    erro403    signin
    Abrir Pagina De Acesso
    Preencher Campo Email       ${EMAIL_ACESSO}
    Preencher Campo Senha       ${SENHA_ACESSO}
    Clicar No Botao Entrar
    Clicar No Sign In Na Tela 403
    Validar Tela Autenticada
    Encerrar Navegador