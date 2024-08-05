class QuadroAulasPage
  include Capybara::DSL

  def open
    visit "/quadro-de-aulas/create"
  end

  def open_listing
    visit "/quadro-de-aulas"
  end

  def filter(filtro)
    selecionar_escola_filtro(filtro[:Escola])
    find('input[type="range"]').set(3)
    selecionar_periodo(filtro[:Periodo])
    selecionar_turma_filtro(filtro[:Turma])
    selecionar_professor(filtro[:Professor])
    selecionar_situacao(filtro[:Situacao])
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

  def selecionar_turma_filtro(turma)
    if (turma != "")
      xpath_turma = get_xpath_span(turma)
      find("input[placeholder$='Turmas']").click()
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

  def selecionar_escola_filtro(escola)
    if (escola != "")
      xpath_escola = get_xpath_span(escola)
      find("input[placeholder='Selecionar Escola']").click()
      find(:xpath, xpath_escola).click()
    end
  end

  def selecionar_periodo(periodo)
    if (periodo != "")
      xpath_periodo = get_xpath_span(periodo)
      find("input[placeholder='Selecionar Períodos']").click()
      find(:xpath, xpath_periodo).click()
    end
  end

  def selecionar_professor(professor)
    if (professor != "")
      xpath_prof = get_xpath_span(professor)
      find("input[placeholder$='Professor']").click()
      find(:xpath, xpath_prof).click
    end
  end

  def selecionar_situacao(situacao)
    if (situacao != "")
      xpath_situacao = get_xpath_span(situacao)
      find("input[placeholder$='situação']").click
      find(:xpath, xpath_situacao).click()
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
