#language: pt

Funcionalidade: Filtro de estudantes
    Sendo um usuário da plataforma didatikos
    Quero filtrar a listagem de estudantes
    Para que eu possa visualizar estudantes filtrados


    @filtro
    Cenario: Limpar filtro ao excluir escola

        Dado que acesso a listagem de estudantes
            E que estou logado como "admin@ditatikos.com" e "didatikos@1010"
            E que eu tenha o seguinte filtro:
            | Escola   | Messias Pedreiro                            |
            | Serie    | 3º ANO - ENSINO MÉDIO                       |
            | Periodo  | Período letivo padrão 2024 - 2024           |
            | Turma    | 3a                                          |
            | Situacao | Novo estudante - primeiro cadastro          |
            | Estado   | Estudante interno - pré rematrícula interna |
        Quando excluo a escola do filtro
        Então o filtro deve estar em branco