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

Quando("excluo a escola do filtro") do
  find(:xpath, '//*[@id="modals-container"]/div/div/div[2]/div/div/div[2]/div[1]/div/div[2]/div[1]/span/i').click()
end

def get_xpath_span(text)
  xpath = "//span[text()='" + text + "']"
  return xpath
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
