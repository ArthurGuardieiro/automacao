#language: pt

Funcionalidade: login
    Sendo um usuário da plataforma
    Quero fazer login no sistema
    Para que eu possa utilizar o software

    @login
    Cenario: Fazer login

        Dado que acesso a página de login
        Quando submeto o seguinte formulário de cadastro:
        |email              |senha         |
        |admin@ditatikos.com|didatikos@1010|
        Então sou redirecionado para o Dashboard

    
    Cenario: Fazer login sem o email

        Dado que acesso a página de login
        Quando submeto o meu login sem o email
        Então vejo a mensagem de alerta: "O campo e-mail é obrigatório."

    
    Cenario: Fazer login sem senha

        Dado que acesso a página de login
        Quando submeto o meu login sem a senha
        Então vejo a mensagem de alerta: "O campo senha é obrigatório."