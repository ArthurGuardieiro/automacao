class QuadroAulasPage
  include Capybara::DSL

  def open
    visit "/quadro-de-aulas/create"
  end

  def create(transmissao)
    find("#titulo").set transmissao[:nome]

    #Selecioninado a escola
    selecionar_escola(transmissao[:escola])

    #Selecionando a turma
    selecionar_turma(transmissao[:turma])

    #Selecionando componente
    selecionar_componente(transmissao[:componente])

    #Selecionando a data da aula
    selecionar_data(transmissao[:data])

    click_button "Salvar"
  end

  def selecionar_turma(turma)
    if (turma != "")
      xpath_turma = get_xpath_span(turma)
      find("input[placeholder='Turma']").click()
      find(:xpath, xpath_turma).click()
    end
  end

  def selecionar_componente(componente)
    if (componente != "")
      xpath_componente = get_xpath_span(componente)
      find("input[placeholder='Componente curricular']").click()
      find(:xpath, xpath_componente).click()
    end
  end

  # Se o dia atual for um sábado não letivo, época de férias ou dia de feriado retornará erro
  def selecionar_data(data)
    if (data == "hoje")
      find("button[data-title-left]").click()
      find("input[placeholder='Data e Hora de Início']").click()
      time = Time.new
      dataHoje = formato_data(time.day, time.month, time.year)
      find("span[aria-label='#{dataHoje}']").click()
    end
  end

  def selecionar_escola(escola)
    if (escola != "")
      xpath_escola = get_xpath_span(escola)
      find(:xpath, '//*[@id="app"]/div[4]/form/div[2]/div[1]/div[2]/div[2]/div/div[1]').click()
      find(:xpath, xpath_escola).click()
    else
      xpath_escola = get_xpath_span("Escola Didatikos - Fernando")
      find(:xpath, '//*[@id="app"]/div[4]/form/div[2]/div[1]/div[2]/div[2]/div/div[1]').click()
      find(:xpath, xpath_escola).click()
    end
  end

  def formato_data(dia, mes, ano)
    meses = [
      "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho",
      "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro",
    ]

    return "#{meses[mes - 1]} #{dia}, #{ano}"
  end
end
