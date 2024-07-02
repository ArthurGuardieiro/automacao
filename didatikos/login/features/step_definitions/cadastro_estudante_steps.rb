Dado('que acesso a página de Cadastro') do
    visit "https://didatikos-hmg.didatikos.com.br/ava/alunos/create"

    login("admin@ditatikos.com", "didatikos@1010")

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

    selecionar_escola(estudante[:escola], '//*[@id="app"]/div[4]/form/div[2]/div[1]/div[1]/div/div/div[1]')

    #Selecionar período letivo
    find(:xpath, '//*[@id="app"]/div[4]/form/div[2]/div[1]/div[2]/div/div/div[1]').click()
    find(:xpath, '//*[@id="null-0"]').click()

    selecionar_turma(estudante[:turma], '//*[@id="app"]/div[4]/form/div[2]/div[2]/div[1]/div/div/div[1]')


    click_button "Salvar"

end

Então('abre um modal de erro com mensagem de {string}') do |expect_alert|
    alert_title = find('.alert-title')
    expect(alert_title.text).to eql "Erro!"
    alert = find('.alert-content')
    expect(alert.text).to eql expect_alert
end

