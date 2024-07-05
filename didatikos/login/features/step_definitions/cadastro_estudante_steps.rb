Dado('que acesso a página de Cadastro') do
    visit "/alunos/create"

end
  
Quando('submeto o seguinte formulário de cadastro:') do |table|
    
    estudante = table.hashes.first

    selecionar_nome(estudante[:nome])
    
    selecioner_sobrenome(estudante[:sobrenome])
    
    find('#data_matricula').set estudante[:data_matricula]
    find('#data_nascimento').set estudante[:data_nascimento]
    find('#email').set Faker::Internet.email(domain: 'gmail.com')
    find('#password').set estudante[:senha]
    find('#password_confirmation').set estudante[:confirma_senha]

    selecionar_escola(estudante[:escola], '//*[@id="app"]/div[4]/div[2]/div/form/div[2]/div[1]/div[1]/div/div/div[1]')

    #Selecionar período letivo
    selecionar_periodo(estudante[:periodo],'//*[@id="app"]/div[4]/div[2]/div/form/div[2]/div[1]/div[2]/div/div/div[1]' )

    selecionar_turma(estudante[:turma], '//*[@id="app"]/div[4]/div[2]/div/form/div[2]/div[2]/div[1]/div/div/div[1]')


    click_button "Salvar"

end

