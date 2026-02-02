*** Settings ***
Documentation     Cenário: Acessos com e-mail e senha válidos/inválidos 
Library           SeleniumLibrary
Resource          ../resources/variables.robot
Resource          ../resources/locators.robot
Resource          keywords_acesso.robot
Library           String
Library           BuiltIn
Library           OperatingSystem

*** Test Cases ***
Acesso Com Email Invalido E Senha Valida
    Abrir Pagina De Acesso
    Preencher Campos Email e Senha Invalidos    ${EMAIL_INVALIDO_FORMATO}    ${SENHA_ACESSO}
    Clicar No Botao Entrar
    Validar Mensagem Erro Email Invalido
    Encerrar Navegador

Acesso Com Email Valido E Senha Invalida
    Abrir Pagina De Acesso
    Preencher Campos Email e Senha Invalidos    ${EMAIL_ACESSO}    ${SENHA_INVALIDA}
    Clicar No Botao Entrar
    Validar Mensagem Erro Senha Invalida
    Encerrar Navegador
Acesso Com Email E Senha Invalidos
    Abrir Pagina De Acesso
    Preencher Campos Email e Senha Invalidos    ${EMAIL_INVALIDO_FORMATO}    ${SENHA_INVALIDA}
    Clicar No Botao Entrar
    Validar Mensagem Erro Dados Invalidos
    Encerrar Navegador