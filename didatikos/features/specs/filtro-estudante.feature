#language: pt

Funcionalidade: Filtro de estudantes
    Sendo um usuário da plataforma didatikos
    Quero filtrar a listagem de estudantes
    Para que eu possa visualizar estudantes filtrados

    Contexto: Login
        * Login com "admin@ditatikos.com" e "didatikos@1010"

    @filtro
    Cenario: Limpar filtro ao excluir escola

        Dado que acesso a listagem de estudantes
            E que eu tenha o seguinte filtro:
            | Escola   | Messias Pedreiro                            |
            | Serie    | 3º ANO - ENSINO MÉDIO                       |
            | Periodo  | Período letivo padrão 2024 - 2024           |
            | Turma    | 3a                                          |
            | situacao | Novo estudante - primeiro cadastro          |
            | estado   | Estudante interno - pré rematrícula interna |
        Quando excluo a escola do filtro
        Então o filtro deve estar em branco