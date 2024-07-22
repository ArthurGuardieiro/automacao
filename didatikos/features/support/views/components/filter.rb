class Filter
  include Capybara::DSL

  def filtro_periodo_letivo
    input = find(:xpath, '//*[@id="modals-container"]/div/div/div[2]/div/div/div[2]/div[3]/div/div/input')
    return input[:value]
  end

  def filtro_exibir_todos
    input = find(:xpath, '//*[@id="modals-container"]/div/div/div[2]/div/div/div[2]/div[7]/div/div/input')
    return input[:value]
  end

  def situacao
    span = find("input[placeholder$='estudante'] + span")
    return span.text
  end

  def situacao_aulas
    span = find("input[placeholder$='situação'] + span")
    return span.text
  end

  def estado
    span = find("input[placeholder$='rematrícula'] + span")
    return span.text
  end
end
