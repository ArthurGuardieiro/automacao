#language: pt

Funcionalidade: Cadastro de quadro de aulas
    Sendo usuário cadastrado na didatikos
    Quero cadastrar uma nova transmissão no quadro de aulas
    Para que eu possa visualizar no quadro de aulas

    Cenario: Nova transmissão
        Dado que acesso a página de nova transmissão
        Quando submeto o cadastro da transmissão
        Então abre um modal de sucesso com a mensagem "tal"