#language: pt

Funcionalidade: Filtro de quadro de aulas
    Sendo um usuário da plataforma didatikos
    Quero filtrar o quadro de aulas
    Para que eu possa visualizar determinadas aulas


    Cenario: Limpar filtro do quadro de aulas ao excluir escola

        Dado que acesso o quadro de aulas
            E que estou logado como "admin@ditatikos.com" e "didatikos@1010"
            E que eu tenha o seguinte filtro de quadro:
            | Escola    | Messias Pedreiro                             |
            | Periodo   | Período letivo padrão 2024 - 2024            |
            | Turma     | 3a                                           |
            | Professor | Ulisses Melo                                 |
            | Situacao  | Aulas que nao possuem planejamentos lançados |
        Quando excluo a escola do filtro
        Então o filtro de quadro de aulas deve estar em branco
    