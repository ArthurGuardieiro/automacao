class ColaboradoresPage
  include Capybara::DSL

  def open
    visit "/colaboradores/create"
  end

  def open_listing
    visit "/colaboradores"
  end

  def create(colaborador)
    selecionar_cargo(colaborador[:cargo])

    selecionar_nome(colaborador[:nome])
    selecioner_sobrenome(colaborador[:sobrenome])
    find("input[placeholder$='Social']").set colaborador[:nome_social] if colaborador[:nome_social] != ""
    find("input[placeholder$='Email']").set Faker::Internet.email(domain: "gmail.com")
    find("input[placeholder$='Cpf']").set colaborador[:cpf]
    selecionar_sexo(colaborador[:sexo])
    selecionar_rede(colaborador[:rede])
    selecionar_escola(colaborador[:escola])
    selecionar_contratacao(colaborador[:contratacao])

    find("#password").set colaborador[:senha]
    find("#password_confirmation").set colaborador[:confirma_senha]
    find("#token").set colaborador[:token]

    click_button "Salvar"
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

  def selecionar_cargo(cargo)
    if (cargo != "")
      xpath_cargo = get_xpath_span(cargo)
      find("input[placeholder$='opções']").click()
      find(:xpath, xpath_cargo).click()
    end
  end

  def selecionar_contratacao(contratacao)
    if (contratacao != "")
      xpath_contratacao = get_xpath_span(contratacao)
      find("input[placeholder$='contratação']").click()
      find(:xpath, xpath_contratacao).click()
    end
  end

  def selecionar_sexo(sexo)
    if (sexo != "")
      xpath_sexo = get_xpath_span(sexo)
      find("input[placeholder$='sexo']").click()
      find(:xpath, xpath_sexo).click()
    end
  end
end
