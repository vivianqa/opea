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
Esqueci Minha Senha
    Abrir Pagina De Acesso
    Sleep    1s
    Clicar Em Esqueci Minha Senha
    Preencher Campo Email    ${EMAIL_ACESSO}
    Clicar Em Confirmar
    Validar Envio De Email
    Validar Permaneceu Na Pagina De Login
    Encerrar Navegador
