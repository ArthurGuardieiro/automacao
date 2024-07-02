Dado('que acesso a página de Cadastro') do
    visit "https://didatikos-hmg.didatikos.com.br/ava/alunos/create"

    login("admin@ditatikos.com", "didatikos@1010")

end
  
Quando('submeto o seguinte formulário de cadastro:') do |table|
    
    user = table.hashes.first

    selecionar_nome(user[:nome])
    
    selecioner_sobrenome(user[:sobrenome])
    
    find('#data_matricula').set user[:data_matricula]
    find('#data_nascimento').set user[:data_nascimento]
    
    
    find('#email').set Faker::Internet.email(domain: 'gmail.com')
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

Então('abre um modal de erro com mensagem de {string}') do |expect_alert|
    alert_title = find('.alert-title')
    expect(alert_title.text).to eql "Erro!"
    alert = find('.alert-content')
    expect(alert.text).to eql expect_alert
end

def selecionar_nome(nome)
    if(nome == "aleatorio")
        find('#first_name').set Faker::Name.first_name
    else
        find('#first_name').set nome
    end
end

def selecioner_sobrenome(sobrenome)
    if(sobrenome == "aleatorio")
        find('#last_name').set Faker::Name.last_name
    else
        find('#last_name').set sobrenome
    end

end