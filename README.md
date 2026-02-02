# 🤖 Testes Automatizados com Robot Framework

Este desafio contém a automação de testes funcionais utilizando o **Robot Framework**, organizado em dois módulos principais:

- **Acesso (Login) de Usuário**
- **Cadastro de Usuário**

---

## 📁 Estrutura do Projeto

robot-tests/
├── cadastro_usuario/
│   ├── cadastro_invalido_cpf.robot
│   ├── cadastro_invalido_email.robot
│   ├── cadastro_invalido_senha.robot
│   ├── cadastro_valido_reenvio_email.robot
│   ├── cadastro_valido.robot
│   └── CpfLibrary.py        # Gerador de CPF
│   ├── keywords_cadastro.robot
│   ├── PasswordGenerator.py  # Gerador de senhas
├── acesso_usuario/
│   ├── acesso_invalido.robot
│   ├── acesso_valido_senha.robot
│   ├── acesso_valido.robot
│   └── keywords_acesso.robot
│   ├── PasswordGenerator.py  # Gerador de senhas
├── resources/
│   ├── variables.robot      # Variáveis globais para o projeto
│   ├── locators.robot       # Localizadores para os elementos da página
│   └── common_keywords.robot  # Keywords comuns para reutilização
├── settings/
│   ├── environment.robot    # Configurações do ambiente (URLs, navegador, etc.)
│   └── config.robot         # Configurações globais (timeouts, etc.)
└── README.md                # Documentação do projeto

---

## 🚀 Como Executar os Testes

### Pré-requisitos

- Python 3.8+
- [Robot Framework](https://robotframework.org/)
- [Browser library](https://github.com/MarketSquare/robotframework-browser) (se estiver usando automação web)
- VS Code (recomendado) com extensão **Robot Framework Language Server**

## Segue o link do projeto

Url: https://sso.opea-uat.solutions/account/signup
E-mail já cadastrado: avaliacao_qa@opea.com.br
CPF já Cadastrado: 96932771047

### Instalação das dependências

```bash
pip install robotframework
pip install robotframework-browser
rfbrowser init

Rodar todos os testes
robot robot-tests/

Rodar apenas os testes de cadastro
robot robot-tests/cadastro_usuario/
robot robot-tests/cadastro_invalido_cpf/
robot robot-tests/cadastro_invalido_email/
robot robot-tests/cadastro_valido/
robot robot-tests/cadastro_valido_reenvio_email/

Rodar apenas os testes de acesso
robot robot-tests/acesso_usuario/
robot robot-tests/acesso_valido.robot
robot robot-tests/acesso_invalido.robot

Rodar testes por tag
robot -i positivo robot-tests/
robot -i negativo robot-tests/
robot -i cadastro robot-tests/
robot -i acesso robot-tests/
robot -i erro403 robot-tests/
robot -i goback robot-tests/
robot -i signin robot-tests/

---


✅ Funcionalidades cobertas

	Cadastro de Usuário
Cadastro com dados válidos
Validação de campos obrigatórios
E-mail e CPF já cadastrados
Formatos inválidos de e-mail, CPF e telefone
Validações de senha (formato, confirmação, etc.)


Cenário 1: Cadastro com todos os campos válidos
Dado que estou na página de cadastro
Quando preencho todos os campos obrigatórios com informações válidas
E a senha atende aos critérios exigidos
E clico em "Cadastre-se"
Então o sistema cadastra o novo usuário com sucesso
E sistema apresenta mensagem para confirmação de email

Cenário 2: Cadastro com todos os campos válidos e reenvio de email de confirmação
Dado que estou na página de cadastro
Quando preencho todos os campos obrigatórios com informações válidas
E a senha atende aos critérios exigidos
E clico em "Cadastre-se"
Então o sistema cadastra o novo usuário com sucesso
E o sistema apresenta mensagem para confirmação de email
Quando clico no botão "Reenviar E-mail"
Então o sistema reenvia o e-mail de confirmação
E o sistema exibe a mensagem "E-mail enviado com sucesso."

Cenário 3: Cadastro com e-mail já cadastrado
Dado que estou na página de cadastro
E já existe um usuário com o e-mail informado
Quando preencho todos os campos obrigatórios com informações válidas
Exceto pelo e-mail, que já está em uso
E clico em "Cadastre-se"
Então o sistema exibe uma mensagem de erro informando que o e-mail já está em uso
E o usuário não é cadastrado

Cenário 4: Cadastro com cpf já cadastrado
Dado que estou na página de cadastro
E já existe um usuário com o CPF informado
Quando preencho todos os campos obrigatórios com informações válidas
Exceto pelo CPF, que já está em uso
E clico em "Cadastre-se"
Então o sistema exibe uma mensagem de erro informando que o CPF já está em uso
E o usuário não é cadastrado

Cenário 5: Cadastro com e-mail inválido
Dado que estou na página de cadastro
Quando preencho todos os campos obrigatórios
Mas informo um e-mail em formato inválido
E clico em "Cadastre-se"
Então o sistema exibe uma mensagem de erro informando que o e-mail é inválido
E o usuário não é cadastrado

Cenário 6: Cadastro com CPF inválido
Dado que estou na página de cadastro
Quando preencho todos os campos obrigatórios
Mas informo um CPF em formato inválido
E clico em "Cadastre-se"
Então o sistema exibe uma mensagem de erro informando que o CPF é inválido
E o usuário não é cadastrado

Cenário 7: Cadastro com e-mail e CPF já cadastrados
Dado que estou na página de cadastro
E já existe um usuário com o e-mail e o CPF informados
Quando preencho todos os campos obrigatórios com essas informações já registradas
E clico em "Cadastre-se"
Então o sistema exibe mensagens de erro informando que o e-mail e o CPF já estão em uso
E o usuário não é cadastrado

Cenário 8: Cadastro com campos obrigatórios em branco
Dado que estou na página de cadastro
Quando deixo um ou mais campos obrigatórios em branco
E clico em "Cadastre-se"
Então o sistema exibe uma mensagem solicitando o preenchimento dos campos obrigatórios
E o usuário não é cadastrado

Cenário 9: Cadastro com Nome completo em branco
Dado que estou na página de cadastro
Quando deixo o campo "Nome completo" em branco
E preencho os demais campos obrigatórios corretamente
E clico em "Cadastre-se"
Então o sistema exibe uma mensagem solicitando o preenchimento do campo "Nome completo"
E o usuário não é cadastrado

Cenário 10: Cadastro com Telefone em branco
Dado que estou na página de cadastro
Quando deixo o campo "Telefone" em branco
E preencho os demais campos obrigatórios corretamente
E clico em "Cadastre-se"
Então o sistema exibe uma mensagem solicitando o preenchimento do campo "Telefone"
E o usuário não é cadastrado

Cenário 11: Cadastro com Empresa em branco
Dado que estou na página de cadastro
Quando deixo o campo "Empresa" em branco
E preencho os demais campos obrigatórios corretamente
E clico em "Cadastre-se"
Então o sistema exibe uma mensagem solicitando o preenchimento do campo "Empresa"
E o usuário não é cadastrado

Cenário 12: Cadastro com senha fora dos critérios exigidos
Dado que estou na página de cadastro
Quando preencho todos os campos obrigatórios
Mas informo uma senha que não atende aos seguintes critérios:
Mínimo 8 caracteres
Pelo menos uma letra maiúscula
Pelo menos uma letra minúscula
Pelo menos um número
Pelo menos um caractere especial
E clico em "Cadastre-se"
Então o sistema exibe uma mensagem de erro informando que a senha é inválida
E o usuário não é cadastrado

Cenário 13: Cadastro com confirmação de senha diferente
Dado que estou na página de cadastro
Quando preencho todos os campos obrigatórios corretamente
Mas informo uma senha diferente no campo "Confirme a senha"
E clico em "Cadastre-se"
Então o sistema exibe uma mensagem de erro informando que as senhas não coincidem
E o usuário não é cadastrado

	Acesso de Usuário
Acesso com dados válidos
E-mail ou CPF inválidos
Formatação incorreta dos dados
Usuário não encontrado


Cenário 1: Acesso com e-mail e senha válidos
Dado que estou na página de acesso
Quando preencho os campos informando um e-mail e senha válidos
E clico em "Entrar"
Então sou redirecionado para a página 403 Forbidden

Cenário 2: Acesso com e-mail e senha válidos
Dado que estou na página de acesso
Quando preencho os campos informando um e-mail e senha válidos
E clico em "Entrar"
Então sou redirecionado para a página inicial do sistema

Cenário 3: Acesso com e-mail e senha válidos - clicar em More Info
Dado que estou na página de acesso  
Quando preencho os campos com um e-mail e senha válidos  
E clico em "Entrar"  
E clico em "More Info"  
Então visualizo a mensagem de erro detalhada

Cenário 4: Acesso com e-mail e senha válidos - clicar em Go Back
Dado que estou na página de acesso  
Quando preencho os campos com um e-mail e senha válidos  
E clico em "Entrar"  
E clico no botão "Go Back"  
Então vejo a mensagem "Authenticated"

Cenário 5: Acesso com e-mail e senha válidos - clicar em Sign in
Dado que estou na página de acesso  
Quando preencho os campos com um e-mail e senha válidos  
E clico em "Entrar"  
E clico no botão "Sign In"  
Então vejo a mensagem "Authenticated"

Cenário 6: Acesso com e-mail inválido e senha válido
Dado que estou na página de acesso
Quando preencho os campos informando um e-mail inválido e senha válido
E clico em "Entrar"
Então o sistema exibe uma mensagem de erro informando e-mail inválido
E permaneço na página de acesso

Cenário 7: Acesso com e-mail válido e senha inválido
Dado que estou na página de acesso
Quando preencho os campos informando um e-mail válido e senha inválido
E clico em "Entrar"
Então o sistema exibe uma mensagem de erro informando senha inválido
E permaneço na página de acesso

Cenário 8: Acesso com e-mail e senha inválidos
Dado que estou na página de acesso
Quando preencho os campos informando e-mail e senha inválidos
E clico em "Entrar"
Então o sistema exibe uma mensagem de erro informando dados inválidos
E permaneço na página de acesso

Cenário 9: Acesso com campos obrigatórios em branco
Dado que estou na página de acesso
Quando deixo o e-mail e/ou senha em branco
E clico em "Entrar"
Então o sistema exibe uma mensagem solicitando o preenchimento dos campos obrigatórios

Cenário 10: Acesso com formato de e-mail incorreto
Dado que estou na página de acesso
Quando preencho o e-mail em formato inválido (ex: "usuario@")
E senha válido
E clico em "Entrar"
Então o sistema exibe uma mensagem de erro de formato inválido de e-mail

Cenário 7: Acesso com senha com formatação inválida
Dado que estou na página de acesso
Quando preencho a senha com formatação inválida
E e-mail válido
E clico em "Entrar"
Então o sistema exibe uma mensagem de erro sobre a senha inválido

Cenário 9: Acesso com e-mail e senha corretos, mas usuário não encontrado
Dado que estou na página de acesso
Quando preencho os campos com um e-mail e senha válidos, mas não cadastrados
E clico em "Entrar"
Então o sistema exibe uma mensagem informando que o usuário não foi encontrado

Cenário 10: Usuário com acesso e esqueceu a senha
Dado que estou na página de acesso
Quando clico em "Esqueci minha senha"
E informo um e-mail válido
Então o sistema envia um e-mail com as instruções para recuperação de senha
E permaneço na página de login



Vivian Raia Charrouf
[Vrc.testquality@gmail.com] | [https://www.linkedin.com/in/vivian-r-c-8a2820377/]
[(41)99823-0156]
