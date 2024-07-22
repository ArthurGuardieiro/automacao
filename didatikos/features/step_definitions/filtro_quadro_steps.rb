Dado("que acesso o quadro de aulas") do
  @quadro_aulas_page.open_listing
end

Dado("que eu tenha o seguinte filtro de quadro:") do |table|
  filtro = table.rows_hash
  @quadro_aulas_page.filter(filtro)
end

Então("o filtro de quadro de aulas deve estar em branco") do
  expect(page).to have_selector("input[placeholder$='Escola'] + span")
  expect(find("input[type='range']")[:value]).to eq("2")
  expect(page).to have_selector("input[placeholder$='Períodos'] + span")
  expect(page).to have_selector("input[placeholder$='Turmas'] + span")
  expect(@filter.situacao_aulas).to eq("Selecionar a situação")
end
