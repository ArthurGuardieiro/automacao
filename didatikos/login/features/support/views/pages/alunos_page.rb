class AlunosPage
  include Capybara::DSL

  def open
    visit "/alunos/create"
  end

  def create(estudante)
    selecionar_nome(estudante[:nome])

    selecioner_sobrenome(estudante[:sobrenome])

    find("#data_matricula").set estudante[:data_matricula]
    find("#data_nascimento").set estudante[:data_nascimento]
    find("#email").set Faker::Internet.email(domain: "gmail.com")
    find("#password").set estudante[:senha]
    find("#password_confirmation").set estudante[:confirma_senha]

    selecionar_escola(estudante[:escola])

    #Selecionar período letivo
    selecionar_periodo(estudante[:periodo])

    selecionar_turma(estudante[:turma])

    click_button "Salvar"
  end

  def selecionar_escola(escola)
    if (escola != "")
      xpath_escola = get_xpath_span(escola)
      find("input[placeholder='Selecionar Escola']").click()
      find(:xpath, xpath_escola).click()
    end
  end

  def selecionar_turma(turma)
    if (turma != "")
      xpath_turma = get_xpath_span(turma)
      find("input[placeholder='Selecionar Turmas']").click()
      find(:xpath, xpath_turma).click()
    end
  end

  def selecionar_periodo(periodo)
    if (periodo != "")
      xpath_periodo = get_xpath_span(periodo)
      find("input[placeholder='Selecionar Períodos']").click
      find(:xpath, xpath_periodo).click()
    end
  end
end
