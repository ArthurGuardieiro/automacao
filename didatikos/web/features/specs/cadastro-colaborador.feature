#language: pt

Funcionalidade: Cadastro de colaboradores
    Sendo um colaborador que está ligado a uma escola
    Quero fazer o meu Cadastro
    Para que eu possa utilizar a plataforma


    Esquema do Cenario: Fazer Cdastro de um Colaborador

        Dado que acesso a página de Cadastro de colaborador
            E que estou logado como "admin@ditatikos.com" e "didatikos@1010"
        Quando submeto o seguinte formulário de cadastro de colaborador:
            | cargo         | nome         | sobrenome         | nome_social         | email         | cpf         | sexo         | rede         | escola         | contratacao         | senha         | confirma_senha         | token         |
            | <cargo_input> | <nome_input> | <sobrenome_input> | <nome_social_input> | <email_input> | <cpf_input> | <sexo_input> | <rede_input> | <escola_input> | <contratacao_input> | <senha_input> | <confirma_senha_input> | <token_input> |

        Então abre um modal de sucesso com mensagem de "Operação realizada com sucesso!"

        Exemplos:
            | cargo_input                  | nome_input | sobrenome_input | nome_social_input | email_input | cpf_input | sexo_input | rede_input        | escola_input     | contratacao_input | senha_input    | confirma_senha_input | token_input |
            | Administrador Didatikos      | aleatorio  | aleatorio       |                   | aleatorio   |           | Masculino  |                   |                  |                   | didatikos@1010 | didatikos@1010       | 1           |
            | Diretor(a)                   | aleatorio  | aleatorio       |                   | aleatorio   |           | Masculino  | ESCOLAS DA ANGOLA | Messias Pedreiro | Efetivo           | didatikos@1010 | didatikos@1010       | 1           |
            | Secretario(a)                | aleatorio  | aleatorio       |                   | aleatorio   |           | Masculino  | ESCOLAS DA ANGOLA | Messias Pedreiro | Efetivo           | didatikos@1010 | didatikos@1010       | 1           |
            | Bibliotecário(a)             | aleatorio  | aleatorio       |                   | aleatorio   |           | Masculino  | ESCOLAS DA ANGOLA | Messias Pedreiro | Efetivo           | didatikos@1010 | didatikos@1010       | 1           |
            | Administrador Rede de Ensino | aleatorio  | aleatorio       |                   | aleatorio   |           | Masculino  | ESCOLAS DA ANGOLA |                  |                   | didatikos@1010 | didatikos@1010       | 1           |
            | Financeiro                   | aleatorio  | aleatorio       |                   | aleatorio   |           | Masculino  | ESCOLAS DA ANGOLA | Messias Pedreiro | Indefinido        | didatikos@1010 | didatikos@1010       | 1           |
            | Analista de RH               | aleatorio  | aleatorio       |                   | aleatorio   |           | Masculino  | ESCOLAS DA ANGOLA |                  | Efetivo           | didatikos@1010 | didatikos@1010       | 1           |
            | Corretor(a)                  | aleatorio  | aleatorio       |                   | aleatorio   |           | Masculino  | ESCOLAS DA ANGOLA | Messias Pedreiro |                   | didatikos@1010 | didatikos@1010       | 1           |
            | Supervisão/Coordenação       | aleatorio  | aleatorio       |                   | aleatorio   |           | Masculino  | ESCOLAS DA ANGOLA | Messias Pedreiro | Contratado        | didatikos@1010 | didatikos@1010       | 1           |
            | Integração                   | aleatorio  | aleatorio       |                   | aleatorio   |           | Masculino  | ESCOLAS DA ANGOLA | Messias Pedreiro |                   | didatikos@1010 | didatikos@1010       | 1           |

