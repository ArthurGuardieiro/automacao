Dado("Login com {string} e {string}") do |email, password|
  @login_page.open
  @login_page.with(email, password)
end

Dado("que acesso a listagem de estudantes") do
  @alunos_page.open_listing
end

Dado("que eu tenha o seguinte filtro de estudante:") do |table|
  click_button "Filtrar"
  @filtro = table.rows_hash
  @alunos_page.filter(@filtro)
end

Então("o filtro de estudantes deve estar em branco") do
  expect(page).to have_selector("input[placeholder$='Escola'] + span")
  expect(page).to have_selector("input[placeholder$='Escolar'] + span") 
  expect(@filter.filtro_periodo_letivo).to eq("2")
  expect(page).to have_selector("input[placeholder$='Períodos'] + span")
  expect(page).to have_selector("input[placeholder$='Turmas'] + span")
  expect(@filter.situacao).to eq("Selecionar a situação cadastral do estudante")
  expect(@filter.filtro_exibir_todos).to eq("2")
  expect(@filter.estado).to eq ("Selecionar o estado da pré rematrícula")
end
