#language: pt

Funcionalidade: Filtro de colaboradores
    Sendo um usuário da plataforma didatikos
    Quero filtrar a listagem de colaboradores
    Para que eu possa visualizar colaboradores filtrados

    Cenario: Limpar filtro ao excluir rede

        Dado que acesso a listagem de colaboradores
            E que estou logado como "admin@ditatikos.com" e "didatikos@1010"
            E que eu tenha o seguinte filtro de colaborador:
            | Rede         | ESCOLAS DA ANGOLA |
            | Escola       | Messias Pedreiro   |
            | Tipo_Usuario | Diretor           |
        Quando exluco a rede do filtro
        Então o filtro de colaboradores deve estar em branco