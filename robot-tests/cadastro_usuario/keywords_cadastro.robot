*** Keywords ***
Abrir Página de Cadastro
    Open Browser    ${URL_CADASTRO}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${CAMPO_NOME_COMPLETO}    ${TIMEOUT_PADRAO}
Gerar Dados Randomicos
    ${cpf}=    Generate CPF
    ${email}=  FakerLibrary.Free Email
    Set Suite Variable    ${CPF_VALIDO}    ${cpf}
    Set Suite Variable    ${EMAIL_VALIDO}  ${email}
Gerar Nome Aleatorio Valido
    ${nome_completo}=    Name
    Set Suite Variable    ${NOME_COMPLETO_VALIDO}    ${nome_completo}
    Log    Nome completo gerado: ${NOME_COMPLETO_VALIDO}
Gerar Telefone Valido Com Mascara
    ${telefone}=    Generate Phone Number
    Set Suite Variable    ${TELEFONE_VALIDO}    ${telefone}
    Log    Telefone gerado com máscara: ${TELEFONE_VALIDO}
Generate Phone Number
    ${ddd}=    Evaluate    random.randint(10, 99)    # Gera um DDD aleatório entre 10 e 99
    ${primeiros5}=    Evaluate    random.randint(10000, 99999)    # Gera os primeiros 5 dígitos
    ${ultimos4}=    Evaluate    random.randint(1000, 9999)    # Gera os últimos 4 dígitos
    ${telefone}=    Set Variable    (${ddd}) ${primeiros5}-${ultimos4}  # Formatar no formato (XX) XXXXX-XXXX
    [Return]    ${telefone}
Gerar Senha Aleatoria Valida
    ${senha}=    Generate Password    10    # A senha deve ter no mínimo 8 caracteres, contendo pelo menos uma letra maiúscula, uma letra minúscula, um número e um caractere especial.
    Set Suite Variable    ${SENHA_VALIDA}    ${senha}
    Log    Senha gerada: ${senha}
Gerar Nome De Empresa Valido
    ${nome_empresa}=    Company
    Set Suite Variable    ${EMPRESA_VALIDA}    ${nome_empresa}
    Log    Nome da empresa gerado: ${EMPRESA_VALIDA}    
Preencher Campo Nome Completo
    [Arguments]    ${nome}
    Input Text    ${CAMPO_NOME_COMPLETO}    ${nome}
Preencher Campo CPF
    [Arguments]    ${cpf}
    Input Text    ${CAMPO_CPF}    ${cpf}
Preencher Campo Email
    [Arguments]    ${email}
    Input Text    ${CAMPO_EMAIL}    ${email}
Preencher Campo Telefone
    [Arguments]    ${telefone}
    Input Text    ${CAMPO_TELEFONE}    ${telefone}
Preencher Campo Empresa
    [Arguments]    ${empresa}
    Input Text    ${CAMPO_EMPRESA}    ${empresa}
Preencher Campo Senha
    [Arguments]    ${senha}
    Input Text    ${CAMPO_SENHA}    ${senha}
Preencher Campo Confirmar Senha
    [Arguments]    ${senha_confirmacao}
    Input Text    ${CAMPO_CONFIRMAR_SENHA}    ${senha_confirmacao}
Preencher Campo Senha Invalida
    Input Text    xpath=//input[@name='userPassword']    ${SENHA_INVALIDA}
Preencher Campo Confirmar Senha Invalida
    Input Text    xpath=//input[@name='userConfirmPassword']    ${SENHA_INVALIDA}
Verificar Mensagem De Erro Senha Invalida
    # 1. Preencher campo de senha com valor inválido
    Input Text    xpath=//input[@name='userPassword']    ${SENHA_INVALIDA}  
    Sleep    1s  # Aguardar a validação do campo após o preenchimento 
    # 2. Verificar borda vermelha (classe danger)
    ${classes}=    Get Element Attribute    xpath=//input[@name='userPassword']    class
    Should Contain    ${classes}    danger  # Verifica se o campo tem a classe 'danger' (borda vermelha)
    # 3. Usar JavaScript para forçar a visibilidade do tooltip
    Execute JavaScript    document.querySelector("div.popper").style.display = "block";  # Força o tooltip a aparecer
    # 4. Esperar até que o texto "A senha deve ter ao menos um caracter especial" apareça no tooltip
    Wait Until Element Contains    xpath=//div[contains(@class, 'popper')]    A senha deve ter ao menos um caracter especial    timeout=5s  # Espera até que o tooltip seja exibido
    # 5. Pegar o texto da div.popper
    ${tooltip_text}=    Get Text    xpath=//div[contains(@class, 'popper')]  # Captura o texto diretamente da div.popper
    Log    Texto do tooltip: ${tooltip_text}  # Exibe o texto capturado
    # 6. Limpar o texto capturado para garantir que não haja espaços extras
    ${tooltip_text_trimmed}=    Evaluate    "${tooltip_text}".strip()    # Remove espaços extras antes e depois do texto
    Log    Texto do tooltip (limpo): ${tooltip_text_trimmed}  # Exibe o texto capturado depois de remover espaços
    # 7. Validar se o texto "A senha deve ter ao menos um caracter especial" está no tooltip de forma simples
    Should Contain    ${tooltip_text_trimmed}    A senha deve ter ao menos um caracter especial   # Verifica se o texto do tooltip contém "A senha deve ter ao menos um caracter especial" 
Clicar No Botão Cadastre-se
    Wait Until Element Is Visible    ${BOTAO_CADASTRAR}    ${TIMEOUT_PADRAO}
    Click Button    ${BOTAO_CADASTRAR}
Verificar Cadastro Com Sucesso
    Wait Until Page Contains    Quase lá!    ${TIMEOUT_PADRAO}
    Page Should Contain         Precisamos que você confirme o seu e-mail para ativar a conta
Reenviar Email De Confirmacao
    Wait Until Element Is Visible    xpath=//button//a[contains(text(), "Reenviar Email")]    ${TIMEOUT_PADRAO}
    Click Element                    xpath=//button//a[contains(text(), "Reenviar Email")]
    ${alert_text}=                  Handle Alert    action=ACCEPT
    [Return]                       ${alert_text}
Verificar Reenvio De Email Com Sucesso
    [Arguments]    ${alert_text}
    Should Be Equal    ${alert_text}    ${MSG_REENVIO_SUCESSO}
Verificar Mensagem De Erro Email
    Wait Until Element Is Visible    ${MENSAGEM_ERRO_LOCATOR_EMAIL}    15s  # Espera até que a mensagem de erro seja visível
    Page Should Contain    Já existe um usuário cadastrado com o e-mail informado.
    Element Should Be Visible    ${CAMPO_EMAIL}    # Verifica se o campo de e-mail ainda está visível para garantir que o cadastro não foi completado
Verificar Mensagem De Erro CPF
    Wait Until Element Is Visible    ${MENSAGEM_ERRO_LOCATOR_CPF}    15s  # Espera até que a mensagem de erro seja visível
    Page Should Contain    Usuário já cadastrado com esse CPF
    Element Should Be Visible    ${CAMPO_EMAIL}    # Verifica se o campo de cpf ainda está visível para garantir que o cadastro não foi completado
Verificar Mensagem De Erro De Email Invalido
    [Documentation]    Verifica borda vermelha e tooltip de erro no campo email inválido  
    # 1. Preencher campo de email com valor inválido
    Input Text    xpath=//input[@name='userEmail']    ${EMAIL_INVALIDO_FORMATO}
    Sleep    1s  # Aguardar a validação do campo após o preenchimento 
    # 2. Verificar borda vermelha (classe danger)
    ${classes}=    Get Element Attribute    xpath=//input[@name='userEmail']    class
    Should Contain    ${classes}    danger  # Verifica se o campo tem a classe 'danger' (borda vermelha)
    # 3. Usar JavaScript para forçar a visibilidade do tooltip
    Execute JavaScript    document.querySelector("div.popper").style.display = "block";  # Força o tooltip a aparecer
    # 4. Esperar até que o texto "Email inválido" apareça no tooltip
    Wait Until Element Contains    xpath=//div[contains(@class, 'popper')]    Email inválido    timeout=5s  # Espera até que o tooltip seja exibido
    # 5. Pegar o texto da div.popper
    ${tooltip_text}=    Get Text    xpath=//div[contains(@class, 'popper')]  # Captura o texto diretamente da div.popper
    Log    Texto do tooltip: ${tooltip_text}  # Exibe o texto capturado
    # 6. Limpar o texto capturado para garantir que não haja espaços extras
    ${tooltip_text_trimmed}=    Evaluate    "${tooltip_text}".strip()    # Remove espaços extras antes e depois do texto
    Log    Texto do tooltip (limpo): ${tooltip_text_trimmed}  # Exibe o texto capturado depois de remover espaços
    # 7. Validar se o texto "Email inválido" está no tooltip de forma simples
    Should Contain    ${tooltip_text_trimmed}    Email inválido  # Verifica se o texto do tooltip contém "Email inválido"
Verificar Mensagem De Erro De CPF Invalido
    [Documentation]    Verifica borda vermelha e tooltip de erro no campo CPF inválido  
    # 1. Preencher campo de CPF com valor inválido
    Input Text    xpath=//input[@name='userDocument']    ${CPF_INVALIDO_FORMATO}  # Substitua por uma variável de CPF inválido
    Sleep    1s  # Aguardar a validação do campo após o preenchimento 
    # 2. Verificar borda vermelha (classe danger)
    ${classes}=    Get Element Attribute    xpath=//input[@name='userDocument']    class
    Should Contain    ${classes}    danger  # Verifica se o campo tem a classe 'danger' (borda vermelha)
    # 3. Usar JavaScript para forçar a visibilidade do tooltip
    Execute JavaScript    document.querySelector("div.popper").style.display = "block";  # Força o tooltip a aparecer
    # 4. Esperar até que o texto "Documento inválido" apareça no tooltip
    Wait Until Element Contains    xpath=//div[contains(@class, 'popper')]    Documento inválido    timeout=5s  # Espera até que o tooltip seja exibido
    # 5. Pegar o texto da div.popper
    ${tooltip_text}=    Get Text    xpath=//div[contains(@class, 'popper')]  # Captura o texto diretamente da div.popper
    Log    Texto do tooltip: ${tooltip_text}  # Exibe o texto capturado
    # 6. Limpar o texto capturado para garantir que não haja espaços extras
    ${tooltip_text_trimmed}=    Evaluate    "${tooltip_text}".strip()    # Remove espaços extras antes e depois do texto
    Log    Texto do tooltip (limpo): ${tooltip_text_trimmed}  # Exibe o texto capturado depois de remover espaços
    # 7. Validar se o texto "Documento inválido" está no tooltip de forma simples
    Should Contain    ${tooltip_text_trimmed}    Documento inválido  # Verifica se o texto do tooltip contém "Documento inválido"
Encerrar Navegador
    Close Browser