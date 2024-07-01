def login(email, senha) 
    find("#email").set email
    find("#password").set senha

    click_button "Login"
end

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