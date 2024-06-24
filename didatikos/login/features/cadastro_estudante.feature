#language: pt

Funcionalidade: Cadastro
    Sendo um estudante que está ligado a uma escola
    Quero fazer o meu Cadastro
    Para que eu possa utilizar a plataforma

    @cadastro
    Cenario: Fazer Cadastro

    Dado que acesso a página de Cadastro
    Quando submeto o seguinte formulário de cadastro:
        |data_matricula|data_nascimento|senha         |confirma_senha|
        |20/06/2024    |15/05/2005     |didatikos@1010|didatikos@1010|
    Então abre um modal de sucesso com mensagem de "Operação realizada com sucesso!" 

    @Esquema_cadastro
    Esquema do Cenario: Tentativa de cadastro
        Dado que acesso a página de Cadastro
        Quando submeto o seguinte formulário de cadastro:
        |data_matricula   |data_nascimento   |senha        |confirma_senha  |
        |<matricula_input>|<nascimento_input>|<senha_input>|<confirma_input>|
        Então abre um modal de erro com mensagem de "<mensagem_output>"

        Exemplos:
        |matricula_input|nascimento_input|senha_input   |confirma_input|mensagem_output                               |
        |               |05/05/2005      |didatikos@1010|didatikos@1010|Data de matricula é inválida. - 1132          |
        |02/02/2024     |                |didatikos@1010|didatikos@1010|Data de nascimento é inválida. - 1132         |
        |02/02/2024     |05/05/2005      |              |didatikos@1010|O campo senha é obrigatório.                  |
        |02/02/2024     |05/05/2005      |didatikos@1010|              |A confirmação para o campo senha não coincide.|
        
