#language: pt

Funcionalidade: Cadastro
    Sendo um estudante que está ligado a uma escola
    Quero fazer o meu Cadastro
    Para que eu possa utilizar a plataforma

    @cadastro
    Cenario: Fazer Cadastro

    Dado que acesso a página de Cadastro
    Quando sumeto o seguinte formulário de cadastro:
        |data_matricula|data_nascimento|primeiro_nome|sobrenome|email            |senha         |escola|periodo_letivo|
        |20/06/2024    |15/05/2005     |Joao         |Silva    |josilva@gmail.com|didatikos@1010|      |              | 
    Então abre um modal com mensagem de sucesso