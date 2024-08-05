class RedePage
  include Capybara::DSL

  def open
    visit "/rede-ensino/create"
  end

  def create(rede)
    find("input[placeholder='Rede']").set rede[:nome]

    selecionar_escola(rede[:escola])
    selecionar_administradores(rede[:administradores])

    find("input[placeholder='Quantidade de cargos ativos']").set rede[:quantidade_cargos_ativos]

    click_button "Salvar"
  end

  def selecionar_escola(escola)
    if (escola != "")
      xpath_escola = get_xpath_span(escola)
      find("input[placeholder='Escolas']").click()
      find(:xpath, xpath_escola).click()
    end
  end

  def selecionar_administradores(admin)
    if (admin != "")
      xpath_admin = get_xpath_span(admin)
      find("input[placeholder='Administradores']").click()
      find(:xpath, xpath_admin).click()
    end
  end
end
