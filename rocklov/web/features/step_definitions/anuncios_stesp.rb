Dado("Login com {string} e {string}") do |email, password|
  @email = email

  @login_page.open
  @login_page.with(email, password)

  # Checkpoint para garantir que estamos no Dashboard
  expect(@dash_page.on_dash?).to be true
end

Dado("que acesso o formulario de cadastro de anúncios") do
  @equipos_page.open
  # isso é um checkpoint para garantir que estou no lugar correto
  expect(page).to have_css "#equipoForm"
end

Dado("que eu tenha o seguinte equipamento:") do |table|
  @anuncio = table.rows_hash

  MongoDB.new.remove_equipo(@anuncio[:nome], @email)
end

Quando("submeto o cadastro desse item") do
  @equipos_page.create(@anuncio)
end

Então("devo ver esse item no meu Dashboard") do
  expect(@dash_page.equipot_list).to have_content @anuncio[:nome]
  expect(@dash_page.equipot_list).to have_content "R$#{@anuncio[:preco]}/di"
end

Então("deve conter a mensagem de alerta: {string}") do |expect_alert|
  expect(@alert.dark).to have_text expect_alert
end

# Remover anúncios

Dado("que eu tenho um anúncio indesejado:") do |table|
  user_id = page.execute_script("return localStorage.getItem('user')")

  thumbnail = File.open(File.join(Dir.pwd, "features/support/fixtures/images", table.rows_hash[:thumb]), "rb")

  @equipo = {
    thumbnail: thumbnail,
    name: table.rows_hash[:nome],
    category: table.rows_hash[:categoria],
    price: table.rows_hash[:preco],
  }

  EquiposService.new.create(@equipo, user_id)

  visit current_path
end

Quando("eu solicito a exclusão desse item") do
  @dash_page.request_removal(@equipo[:name])
  sleep 1 # think time
end

Quando("confirmo a exclusão") do
  @dash_page.confirm_removal
end

Então("não devo ver esse item no meu dashboard") do
  expect(@dash_page.has_no_equipo?(@equipo[:name])).to be true
end

Quando("não confirmo a solicitação") do
  @dash_page.cancel_removal
end

Então("esse item deve permanecer no meu dashboard") do
  expect(@dash_page.equipot_list).to have_content @equipo[:name]
end
