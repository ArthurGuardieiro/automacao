Dado("que acesso a listagem de colaboradores") do
  @colaboradores_page.open_listing
end

Dado("que eu tenha o seguinte filtro de colaborador:") do |table|
  click_button "Filtrar"
  filtro = table.rows_hash
  @colaboradores_page.filter(filtro)
end

Quando("exluco a rede do filtro") do
  find(:xpath, '//*[@id="modals-container"]/div/div/div[2]/div/div/div[2]/div[1]/div/div[2]/div[1]/span/i').click()
end

Então("o filtro de colaboradores deve estar em branco") do
  expect(page).to have_selector("input[placeholder$='ensino'] + span")
  expect(page).to have_selector("input[placeholder$='Escola'] + span")
  expect(page).to have_selector("input[placeholder$='usuário'] + span")
  expect(find("input[type='range']")[:value]).to eq("2")
end
