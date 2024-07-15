Dado("que estou logado como {string} e {string}") do |email, password|
  @login_page.with(email, password)
end

Então("abre um modal de sucesso com mensagem de {string}") do |expect_alert|
  expect(@alert.title).to eql "Sucesso!"
  expect(@alert.content).to eql expect_alert
end

Então("abre um modal de erro com mensagem de {string}") do |expect_alert|
  expect(@alert.title).to eql "Erro!"
  expect(@alert.content).to eql expect_alert
end

def get_xpath_span(text)
  xpath = "//span[text()='" + text + "']"
  return xpath
end

def selecionar_escola(escola, xpath_elemento)
  if (escola != "")
    find(:xpath, xpath_elemento).click()
    xpath_escola = get_xpath_span(escola)
    find(:xpath, xpath_escola).click()
  end
end

def selecionar_periodo(periodo, xpath_elemento)
  if (periodo != "")
    xpath_periodo = get_xpath_span(periodo)
    find(:xpath, xpath_elemento).click
    find(:xpath, xpath_periodo).click()
  end
end

def selecionar_nome(nome)
  if (nome == "aleatorio")
    find("#first_name").set Faker::Name.first_name
  else
    find("#first_name").set nome
  end
end

def selecioner_sobrenome(sobrenome)
  if (sobrenome == "aleatorio")
    find("#last_name").set Faker::Name.last_name
  else
    find("#last_name").set sobrenome
  end
end
