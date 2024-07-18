#language: pt

Funcionalidade: login
    Sendo um usuário da plataforma
    Quero fazer login no sistema
    Para que eu possa utilizar o software

    @login
    Cenario: Fazer login

        Dado que acesso a página de login
        Quando submeto minhas credenciais com "admin@ditatikos.com" e "didatikos@1010"
        Então sou redirecionado para o Dashboard

    @Esquema
    Esquema do Cenario: Tentativa de login 
        Dado que acesso a página de login
         Quando submeto minhas credenciais com "<email_input>" e "<senha_input>"
        Então vejo a mensagem de alerta: '<mensagem_output>'

        Exemplos:
        |email_input         |senha_input   |mensagem_output              |
        |                    |didatikos@1010|O campo e-mail é obrigatório.|
        |admind@ditatikos.com|              |O campo senha é obrigatório. |
        |admin$ditatikos.com |didatikos@1010|Email ou senha inválidos!    |
