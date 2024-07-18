#language: pt

Funcionalidade: Cadastro de estudante
    Sendo um estudante que está ligado a uma escola
    Quero fazer o meu Cadastro
    Para que eu possa utilizar a plataforma

    @cadastro
    Cenario: Fazer Cadastro de um Estudante

        Dado que acesso a página de Cadastro de estudante
            E que estou logado como "admin@ditatikos.com" e "didatikos@1010"
        Quando submeto o seguinte formulário de cadastro de estudante:
            | escola           | periodo                           | turma | nome      | sobrenome | data_matricula | data_nascimento | senha          | confirma_senha |
            | Messias Pedreiro | Período letivo padrão 2024 - 2024 | 3a    | aleatorio | aleatorio | 20/06/2024     | 15/05/2005      | didatikos@1010 | didatikos@1010 |
        Então abre um modal de sucesso com mensagem de "Operação realizada com sucesso!"

    @Esquema_cadastro
    Esquema do Cenario: Tentativa de cadastro de estudante
        Dado que acesso a página de Cadastro de estudante
            E que estou logado como "admin@ditatikos.com" e "didatikos@1010"
        Quando submeto o seguinte formulário de cadastro de estudante:
            | escola         | periodo         | turma         | nome         | sobrenome         | data_matricula    | data_nascimento    | senha         | confirma_senha   |
            | <escola_input> | <periodo_input> | <turma_input> | <nome_input> | <sobrenome_input> | <matricula_input> | <nascimento_input> | <senha_input> | <confirma_input> |
        Então abre um modal de erro com mensagem de "<mensagem_output>"

        Exemplos:
            | escola_input     | periodo_input                     | turma_input | nome_input | sobrenome_input | matricula_input | nascimento_input | senha_input    | confirma_input | mensagem_output                                                     |
            |                  |                                   |             | aleatorio  | aleatorio       | 02/02/2024      | 05/05/2005       | didatikos@1010 | didatikos@1010 | O campo turma é obrigatório.                                        |
            | Messias Pedreiro |                                   |             | aleatorio  | aleatorio       | 02/02/2024      | 05/05/2005       | didatikos@1010 | didatikos@1010 | O campo turma é obrigatório.                                        |
            | Messias Pedreiro | Período letivo padrão 2024 - 2024 |             | aleatorio  | aleatorio       | 02/02/2024      | 05/05/2005       | didatikos@1010 | didatikos@1010 | O campo turma é obrigatório.                                        |
            | Messias Pedreiro | Período letivo padrão 2024 - 2024 | 3a          |            | aleatorio       | 02/02/2024      | 05/05/2005       | didatikos@1010 | didatikos@1010 | O campo primeiro nome é obrigatório.                                |
            | Messias Pedreiro | Período letivo padrão 2024 - 2024 | 3a          | aleatorio  |                 | 02/02/2024      | 05/05/2005       | didatikos@1010 | didatikos@1010 | O campo sobrenome é obrigatório.                                    |
            | Messias Pedreiro | Período letivo padrão 2024 - 2024 | 3a          | aleatorio  | aleatorio       |                 | 05/05/2005       | didatikos@1010 | didatikos@1010 | Data de matricula é inválida. - 1132                                |
            | Messias Pedreiro | Período letivo padrão 2024 - 2024 | 3a          | aleatorio  | aleatorio       | 02/02/2024      |                  | didatikos@1010 | didatikos@1010 | Data de nascimento é inválida. - 1132                               |
            | Messias Pedreiro | Período letivo padrão 2024 - 2024 | 3a          | aleatorio  | aleatorio       | 02/02/2024      | 05/05/2005       |                | didatikos@1010 | O campo senha é obrigatório.                                        |
            | Messias Pedreiro | Período letivo padrão 2024 - 2024 | 3a          | aleatorio  | aleatorio       | 02/02/2024      | 05/05/2005       | didatikos@1010 |                | A confirmação para o campo senha não coincide.                      |
            | Messias Pedreiro | Período letivo padrão 2024 - 2024 | 3a          | aleatorio  | aleatorio       | 02/02/2024      | 05/05/2015       | didatikos@1010 | didatikos@1010 | Estudante menor de idade, email do responsável é obrigatorio - 1132 |

