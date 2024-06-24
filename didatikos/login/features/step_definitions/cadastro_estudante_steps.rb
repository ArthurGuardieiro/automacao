Dado('que acesso a página de Cadastro') do
    visit "https://didatikos-hmg.didatikos.com.br/ava/alunos/create"

    login("admin@ditatikos.com", "didatikos@1010")

end
  
Quando('submeto o seguinte formulário de cadastro:') do |table|
    
    user = table.hashes.first
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    email_name = first_name + last_name
    
    find('#data_matricula').set user[:data_matricula]
    find('#data_nascimento').set user[:data_nascimento]
    find('#first_name').set first_name
    find('#last_name').set last_name
    find('#email').set Faker::Internet.email(name: email_name, domain: 'gmail.com')
    find('#password').set user[:senha]
    find('#password_confirmation').set user[:confirma_senha]

    #Selecionar escola
    find(:xpath, '//*[@id="app"]/div[4]/form/div[2]/div[1]/div[1]/div/div/div[1]').click()
    find(:xpath, '//*[@id="null-2"]').click()

    #Selecionar período letivo
    find(:xpath, '//*[@id="app"]/div[4]/form/div[2]/div[1]/div[2]/div/div/div[1]').click()
    find(:xpath, '//*[@id="null-0"]').click()

    #Selecionar turma
    find(:xpath, '//*[@id="app"]/div[4]/form/div[2]/div[2]/div[1]/div/div/div[1]').click()
    find(:xpath, '//*[@id="null-0"]').click()

    click_button "Salvar"

end

Então('abre um modal de sucesso com mensagem de {string}') do |expect_alert|
    alert_title = find('.alert-title')
    expect(alert_title.text).to eql "Sucesso!"
    alert = find('.alert-content')
    expect(alert.text).to eql expect_alert
end

Então('abre um modal de erro com mensagem de {string}') do |expect_alert|
    alert_title = find('.alert-title')
    expect(alert_title.text).to eql "Erro!"
    alert = find('.alert-content')
    expect(alert.text).to eql expect_alert
end