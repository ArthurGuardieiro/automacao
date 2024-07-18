#language: pt

Funcionalidade: Cadastro de quadro de aulas
    Sendo usuário cadastrado na didatikos
    Quero cadastrar uma nova transmissão no quadro de aulas
    Para que eu possa visualizar no quadro de aulas

    @trans
    Cenario: Nova transmissão
        Dado que acesso a página de nova transmissão
        E que estou logado como "admin@ditatikos.com" e "didatikos@1010"
        Quando submeto o seguinte cadastro da transmissão:
        #Data somente hoje pois é o único dia que não é possível quebrar o calendário de cadastro
        |nome     |escola          |turma|componente|data|
        |Português|Messias Pedreiro|3a   |Português |hoje|
        Então abre um modal de sucesso com mensagem de "Quadro de aulas cadastrado com sucesso!"
        

    @Esquema_transmissao
    Esquema do Cenario: Tentativa de cadastro de transmissao
        Dado que acesso a página de nova transmissão
        E que estou logado como "admin@ditatikos.com" e "didatikos@1010"
        Quando submeto o seguinte cadastro da transmissão:
        |nome        |escola        |turma        |data        |componente        |
        |<nome_input>|<escola_input>|<turma_input>|<data_input>|<componente_input>|
        Então abre um modal de erro com mensagem de "<mensagem_output>"

        Exemplos:
        |nome_input|escola_input    |turma_input|componente_input|data_input|mensagem_output                                               |
        |          |Messias Pedreiro|3a         |Português       |hoje      |O campo titulo é obrigatório.                                 |
        |Português |                |           |                |          |O campo sala é obrigatório. O campo input itens é obrigatório.|
        |Português |Messias Pedreiro|           |                |          |O campo sala é obrigatório. O campo input itens é obrigatório.|
        |Português |Messias Pedreiro|3a         |                |          |O campo sala é obrigatório. O campo input itens é obrigatório.|
        |Português |Messias Pedreiro|3a         |Português       |          |O campo input itens é obrigatório.                            |
        
        