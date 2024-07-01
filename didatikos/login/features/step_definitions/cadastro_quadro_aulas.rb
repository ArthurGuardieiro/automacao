Dado('que acesso a página de nova transmissão') do

    visit "https://didatikos-hmg.didatikos.com.br/ava/quadro-de-aulas/create"

    login("admin@ditatikos.com", "didatikos@1010")
end
  
Quando('submeto o cadastro da transmissão') do
    escola = "Escola Municipal Professor Balena"
    xpath_escola = get_xpath_span(escola)

    turma = "2.o ANO - MB2 173 - EDNA"
    xpath_turma = get_xpath_span(turma)

    componente = "GEOGRAFIA"
    xpath_componente = get_xpath_span(componente)

    

    
    find("#titulo").set "Portugues"

    #Selecioninado a escola
    find(:xpath, '//*[@id="app"]/div[4]/form/div[2]/div[1]/div[2]/div[2]/div/div[1]').click()
    find(:xpath, xpath_escola).click()

    #Selecionando a turma
    find(:xpath, '//*[@id="app"]/div[4]/form/div[2]/div[1]/div[3]/div/div/div[1]').click()
    find(:xpath, xpath_turma).click()

    find(:xpath, '//*[@id="app"]/div[4]/form/div[2]/div[1]/div[4]/div/div/div[1]').click()
    find(:xpath, xpath_componente).click()

    find(:xpath, '//*[@id="app"]/div[4]/form/div[2]/div[4]/div/button').click()
    find(:xpath, '//*[@id="app"]/div[4]/form/div[2]/div[4]/div[1]/div[1]/div/div/input[2]').click()
    time = Time.new
    dataHoje = formato_data(time.day, time.month, time.year)
    xpath_data = get_xpath_data(dataHoje)
    find(:xpath, xpath_data).click()

    click_button 'Salvar'

    sleep 5
end
  
Então('abre um modal de sucesso com a mensagem {string}') do |string|
    pending # Write code here that turns the phrase above into concrete actions
end