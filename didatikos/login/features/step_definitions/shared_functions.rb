def get_xpath_span(text) 
    xpath = "//span[text()='" + text + "']"
    return xpath
end

def get_xpath_data(text)
    xpath = "//span[@aria-label='#{text}']"
    return xpath
end

def formato_data(dia, mes, ano) 
    meses = [
    "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", 
    "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"
  ]

    return "#{meses[mes - 1]} #{dia}, #{ano}"

end

Então('abre um modal de sucesso com mensagem de {string}') do |expect_alert|
    alert_title = find('.alert-title')
    expect(alert_title.text).to eql "Sucesso!"
    alert = find('.alert-content')
    expect(alert.text).to eql expect_alert
end

def selecionar_escola(escola, xpath_elemento)
    if(escola != "")
        xpath_escola = get_xpath_span(escola)
        find(:xpath, xpath_elemento).click()
        find(:xpath, xpath_escola).click()
    end

end

def selecionar_turma(turma, xpath_elemento)

    if(turma != "")
        xpath_turma = get_xpath_span(turma)
        find(:xpath, xpath_elemento).click()
        find(:xpath, xpath_turma).click()
    end


end

def selecionar_periodo(periodo, xpath_elemento)
    if(periodo != "")
        xpath_periodo = get_xpath_span(periodo)
        find(:xpath, xpath_elemento).click
        find(:xpath, xpath_periodo).click()
    end
    
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