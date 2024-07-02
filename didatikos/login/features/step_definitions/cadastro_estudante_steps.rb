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

def selecionar_escola(escola)

    puts "entrou na func"

    if(escola != "" )
        puts "entrou aqui dentro"
        xpath_escola = get_xpath_span(escola)
        find(:xpath, ).click()
        find(:xpath, xpath_escola).click()
    else
        puts "foi para o else"
    end

end