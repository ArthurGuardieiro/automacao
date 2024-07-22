class ColaboradoresPage
  include Capybara::DSL

  def open_listing
    visit "/colaboradores"
  end

  def filter(filtro)
    selecionar_rede(filtro[:Rede])
    selecionar_escola(filtro[:Escola])
    selecionar_tipo_usuario(filtro[:Tipo_Usuario])
    find('input[type="range"]').set(3)
  end

  def selecionar_rede(rede)
    if (rede != "")
      xpath_rede = get_xpath_span(rede)
      find("input[placeholder$='ensino']").click()
      find(:xpath, xpath_rede).click
    end
  end

  def selecionar_escola(escola)
    if (escola != "")
      xpath_escola = get_xpath_span(escola)
      find("input[placeholder='Selecionar Escola']").click()
      find(:xpath, xpath_escola).click()
    end
  end

  def selecionar_tipo_usuario(tipo_usuario)
    if (tipo_usuario != "")
      xpath_tipo_usuario = get_xpath_span(tipo_usuario)
      find("input[placeholder$='usuário']").click()
      find(:xpath, xpath_tipo_usuario).click()
    end
  end
end
