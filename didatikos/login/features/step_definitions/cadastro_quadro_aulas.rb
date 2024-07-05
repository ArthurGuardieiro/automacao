Dado('que acesso a página de nova transmissão') do

    visit "/quadro-de-aulas/create"

end

Quando('submeto o seguinte cadastro da transmissão:') do |table|

    transmissao = table.hashes.first

    find("#titulo").set transmissao[:nome]

    #Selecioninado a escola
    selecionar_escola_quadro(transmissao[:escola], '//*[@id="app"]/div[4]/form/div[2]/div[1]/div[2]/div[2]/div/div[1]')

    #Selecionando a turma
    selecionar_turma(transmissao[:turma], '//*[@id="app"]/div[4]/form/div[2]/div[1]/div[3]/div/div/div[1]')

    #Selecionando componente
    selecionar_componente(transmissao[:componente])

    #Selecionando a data da aula
    selecionar_data(transmissao[:data])
    

    click_button 'Salvar'

end



def selecionar_componente(componente)
    if(componente != "") 
        xpath_componente = get_xpath_span(componente)
        find(:xpath, '//*[@id="app"]/div[4]/form/div[2]/div[1]/div[4]/div/div/div[1]').click()
        find(:xpath, xpath_componente).click()
    end

end

def selecionar_data(data)
    
    if(data == "hoje")
        find(:xpath, '//*[@id="app"]/div[4]/form/div[2]/div[4]/div/button').click()
        find(:xpath, '//*[@id="app"]/div[4]/form/div[2]/div[4]/div[1]/div[1]/div/div/input[2]').click()
        time = Time.new
        dataHoje = formato_data(time.day, time.month, time.year)
        xpath_data = get_xpath_data(dataHoje)
        find(:xpath, xpath_data).click()
    end

end

def selecionar_escola_quadro(escola, xpath_elemento)
    if(escola != "")
        xpath_escola = get_xpath_span(escola)
        find(:xpath, xpath_elemento).click()
        find(:xpath, xpath_escola).click()
    else
        xpath_escola = get_xpath_span("Escola Didatikos - Fernando")
        find(:xpath, xpath_elemento).click()
        find(:xpath, xpath_escola).click()
    end

end