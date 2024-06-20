#language: pt

Funcionalidade: Cadastro
    Sendo um estudante que está ligado a uma escola
    Quero fazer o meu Cadastro
    Para que eu possa utilizar a plataforma

    Cenario: Fazer Cadastro

    Dado que acesso a página de Cadastro
    Quando sumeto o seguinte formulário de cadastro:
        |primeiro_nome|sobrenome|email            |senha         |
        |Joao         |Silva    |josilva@gmail.com|didatikos@1010|
    Então abre um modal com mensagem de sucesso