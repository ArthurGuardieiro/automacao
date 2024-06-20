Dado('que acesso a página de Cadastro') do
    visit "https://didatikos-hmg.didatikos.com.br/ava/alunos/create"

    login("admin@ditatikos.com", "didatikos@1010")

end
  
Quando('sumeto o seguinte formulário de cadastro:') do |table|
    
end
  
Então('abre um modal com mensagem de sucesso') do
    pending # Write code here that turns the phrase above into concrete actions
end