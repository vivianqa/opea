*** Settings ***
Documentation     Cenários: Cadastro com e-mail já cadastrado/email invalido
Resource          ../settings/config.robot  
Resource          ../resources/variables.robot
Resource          ../resources/locators.robot
Resource          keywords_cadastro.robot
Library           SeleniumLibrary
Library           FakerLibrary
Library           String
Library           BuiltIn
Library           OperatingSystem
Library           CpfLibrary.py
Library           PasswordGenerator.py

*** Test Cases ***
Cadastro Com Dados Randomicos
    [Tags]    cadastro    negativo
    Gerar Nome Aleatorio Valido
    Log    Nome gerado: ${NOME_COMPLETO_VALIDO}
    Gerar Nome De Empresa Valido
    Log    Nome da empresa gerado: ${EMPRESA_VALIDA}
    Gerar Senha Aleatoria Valida
    Log    Senha gerada: ${SENHA_VALIDA}
    Gerar Telefone Valido Com Mascara
    Log    Telefone gerado com máscara: ${TELEFONE_VALIDO}
    Gerar Dados Randomicos
    Abrir Página de Cadastro
    Preencher Campo Nome Completo      ${NOME_COMPLETO_VALIDO}
    Preencher Campo CPF                ${CPF_VALIDO}
    Preencher Campo Email              ${EMAIL_EXISTENTE}
    Preencher Campo Telefone           ${TELEFONE_VALIDO}
    Preencher Campo Empresa            ${EMPRESA_VALIDA}
    Preencher Campo Senha              ${SENHA_VALIDA}
    Preencher Campo Confirmar Senha    ${SENHA_VALIDA}
    Clicar no Botão Cadastre-se
    Sleep    3s
    Verificar Mensagem De Erro Email
    Encerrar Navegador

Cadastro Com Email Invalido
    [Tags]    cadastro    negativo
    Gerar Nome Aleatorio Valido
    Log    Nome gerado: ${NOME_COMPLETO_VALIDO}
    Gerar Nome De Empresa Valido
    Log    Nome da empresa gerado: ${EMPRESA_VALIDA}
    Gerar Senha Aleatoria Valida
    Log    Senha gerada: ${SENHA_VALIDA}
    Gerar Telefone Valido Com Mascara
    Log    Telefone gerado com máscara: ${TELEFONE_VALIDO}
    Gerar Dados Randomicos
    Abrir Página de Cadastro
    ${EMAIL_INVALIDO_FORMATO}=    Set Variable    invalidemail.com
    Preencher Campo Nome Completo      ${NOME_COMPLETO_VALIDO}
    Preencher Campo CPF                ${CPF_VALIDO}
    Preencher Campo Email              ${EMAIL_INVALIDO_FORMATO} 
    Preencher Campo Telefone           ${TELEFONE_VALIDO}
    Preencher Campo Empresa            ${EMPRESA_VALIDA}
    Preencher Campo Senha              ${SENHA_VALIDA}
    Preencher Campo Confirmar Senha    ${SENHA_VALIDA}
    Clicar no Botão Cadastre-se
    Verificar Mensagem De Erro De Email Invalido
    Encerrar Navegador