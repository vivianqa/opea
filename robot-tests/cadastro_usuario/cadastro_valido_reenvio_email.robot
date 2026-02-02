*** Settings ***
Documentation     Cenário: Cadastro com dados randomicos e reenvio de e-mail de confirmação
Resource          ../settings/config.robot  
Resource          ../resources/variables.robot
Resource          ../resources/locators.robot
Resource          keywords_cadastro.robot
Library           SeleniumLibrary
Library           FakerLibrary
Library           CpfLibrary.py
Library           PasswordGenerator.py


*** Test Cases ***
Cadastro Com Dados Randomicos e Reenvio de E-mail
    [Tags]    cadastro    positivo
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
    Preencher Campo Email              ${EMAIL_VALIDO}
    Preencher Campo Telefone           ${TELEFONE_VALIDO}
    Preencher Campo Empresa            ${EMPRESA_VALIDA}
    Preencher Campo Senha              ${SENHA_VALIDA}
    Preencher Campo Confirmar Senha    ${SENHA_VALIDA}
    Clicar no Botão Cadastre-se
    Verificar Cadastro Com Sucesso
    ${alert_text}=    Reenviar Email De Confirmacao
    Verificar Reenvio De Email Com Sucesso    ${alert_text}
    Encerrar Navegador