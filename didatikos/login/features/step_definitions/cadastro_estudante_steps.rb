Dado('que acesso a página de Cadastro') do
    visit "https://didatikos-hmg.didatikos.com.br/ava/alunos/create"

    login("admin@ditatikos.com", "didatikos@1010")

end
  
Quando('sumeto o seguinte formulário de cadastro:') do |table|
    
    user = table.hashes.first
    
    find('#data_matricula').set user[:data_matricula]
    find('#data_nascimento').set user[:data_nascimento]
    find('#first_name').set user[:primeiro_nome]
    find('#last_name').set user[:sobrenome]
    find('#email').set user[:email]
    find('#password').set user[:senha]
    find('#password_confirmation').set user[:senha]

    sleep 4

end
  
Então('abre um modal com mensagem de sucesso') do
    pending # Write code here that turns the phrase above into concrete actions
end