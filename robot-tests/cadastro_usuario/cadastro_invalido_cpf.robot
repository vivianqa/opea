*** Settings ***
Documentation     Cenários: Cadastro com cpf já cadastrado/cpf invalido
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
    Preencher Campo CPF                ${CPF_EXISTENTE}
    Preencher Campo Email              ${EMAIL_VALIDO}
    Preencher Campo Telefone           ${TELEFONE_VALIDO}
    Preencher Campo Empresa            ${EMPRESA_VALIDA}
    Preencher Campo Senha              ${SENHA_VALIDA}
    Preencher Campo Confirmar Senha    ${SENHA_VALIDA}
    Clicar no Botão Cadastre-se
    Sleep    3s
    Verificar Mensagem De Erro CPF
    Encerrar Navegador

Cadastro Com CPF Invalido
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
    ${CPF_INVALIDO_FORMATO}=    Set Variable    12345678900
    Preencher Campo Nome Completo      ${NOME_COMPLETO_VALIDO}
    Preencher Campo CPF                ${CPF_INVALIDO_FORMATO}
    Preencher Campo Email              ${EMAIL_VALIDO} 
    Preencher Campo Telefone           ${TELEFONE_VALIDO}
    Preencher Campo Empresa            ${EMPRESA_VALIDA}
    Preencher Campo Senha              ${SENHA_VALIDA}
    Preencher Campo Confirmar Senha    ${SENHA_VALIDA}
    Clicar no Botão Cadastre-se
    Verificar Mensagem De Erro De CPF Invalido
    Encerrar Navegador