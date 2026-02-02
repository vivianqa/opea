*** Settings ***
Documentation     Cenário: Cadastro com senha invalida
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

*** Test Cases ***
Cadastro Com Senha Invalida
    [Tags]    cadastro    negativo
    Gerar Nome Aleatorio Valido
    Log    Nome gerado: ${NOME_COMPLETO_VALIDO}
    Gerar Nome De Empresa Valido
    Log    Nome da empresa gerado: ${EMPRESA_VALIDA}
    Gerar Telefone Valido Com Mascara
    Log    Telefone gerado com máscara: ${TELEFONE_VALIDO}
    Gerar Dados Randomicos
    Abrir Página de Cadastro
   ${SENHA_INVALIDA}     Set Variable  senha123
   ${CONFIRMA_SENHA_INVALIDA}    Set Variable  senha123
    Preencher Campo Nome Completo      ${NOME_COMPLETO_VALIDO}
    Preencher Campo CPF                ${CPF_VALIDO}
    Preencher Campo Email              ${EMAIL_VALIDO} 
    Preencher Campo Telefone           ${TELEFONE_VALIDO}
    Preencher Campo Empresa            ${EMPRESA_VALIDA}
    Preencher Campo Senha              ${SENHA_INVALIDA}
    Preencher Campo Confirmar Senha    ${CONFIRMA_SENHA_INVALIDA}
    Clicar no Botão Cadastre-se
    Verificar Mensagem De Erro Senha Invalida
    Encerrar Navegador