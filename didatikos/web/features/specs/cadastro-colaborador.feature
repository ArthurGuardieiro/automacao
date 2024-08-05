#language: pt

Funcionalidade: Cadastro de colaboradores
    Sendo um colaborador que está ligado a uma escola
    Quero fazer o meu Cadastro
    Para que eu possa utilizar a plataforma

    @cadastro-colaborador
    Cenario: Fazer Cdastro de um Colaborador

        Dado que acesso a página de Cadastro de colaborador
            E que estou logado como "admin@ditatikos.com" e "didatikos@1010"
        Quando submeto o seguinte formulário de cadastro de colaborador:
            | cargo      | nome      | sobrenome | nome_social | email     | cpf | sexo      | rede              | escola           | contratacao | senha          | confirma_senha | token |
            | Financeiro | aleatorio | aleatorio |             | aleatorio |     | Masculino | ESCOLAS DA ANGOLA | Messias Pedreiro | Efetivo     | didatikos@1010 | didatikos@1010 | 1     |
        Então abre um modal de sucesso com mensagem de "Operação realizada com sucesso!"
