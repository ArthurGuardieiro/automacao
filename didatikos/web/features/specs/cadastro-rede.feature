#language: pt

Funcionalidade: Cadastro de rede Escolar
    Sendo uma escola que contratou o serviço
    Quero fazer o cadastro da sua rede escolar
    Para que eu possa utilizar a plataforma

    @rede
    Cenario: Nova rede

        Dado que acesso a página de nova rede
            E que estou logado como "admin@ditatikos.com" e "didatikos@1010"
        Quando submeto o seguinte formulário de cadastro de rede:
            | nome           | escola | administradores        | quantidade_cargos_ativos |
            | Escolas da Ang |        | Admin Colégio Nacional | 3                        |
        Então abre um modal de sucesso com mensagem de "Rede de ensino cadastrada com sucesso!"

    @cenario_rede
    Esquema do Cenario: Tentativa de cadastro de rede

        Dado que acesso a página de nova rede
            E que estou logado como "admin@ditatikos.com" e "didatikos@1010"
        Quando submeto o seguinte formulário de cadastro de rede:
            | nome         | escola         | administradores | quantidade_cargos_ativos |
            | <nome_input> | <escola_input> | <admin_input>   | <qtd_cargo_input>        |
        Então abre um modal de erro com mensagem de "<mensagem_output>"

        Exemplos:
            | nome_input | escola_input | admin_input            | qtd_cargo_input | mensagem_output                                                         |
            |            |              | Admin Colégio Nacional | 1               | Necessário preencher o nome da rede de ensino!                          |
            | Escolas BR |              |                        | 1               | Necessário selecionar ao menos um administrador!                        |
            | Escolas BR |              | Admin Colégio Nacional |                 | Necessário informar a quantidade máxima de cargos ativos por professor! |