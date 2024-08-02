Dado('Login com {string} e {string}') do |email, password|
    @email = email
    
    @login_page.open
    @login_page.with(email, password)
end
  
Dado('que acesso o formulario de cadastro de anúncios') do
    @equipos_page.open
    # isso é um checkpoint para garantir que estou no lugar correto
    expect(page).to have_css "#equipoForm"
end

Dado('que eu tenha o seguinte equipamento:') do |table|
    @anuncio = table.rows_hash

    MongoDB.new.remove_equipo(@anuncio[:nome], @email)
end
  
Quando('submeto o cadastro desse item') do

    @equipos_page.create(@anuncio)
end
  
Então('devo ver esse item no meu Dashboard') do
    
    expect(@dash_page.equipot_list).to have_content @anuncio[:nome]
    expect(@dash_page.equipot_list).to have_content "R$#{@anuncio[:preco]}/di"
end

Então('deve conter a mensagem de alerta: {string}') do |expect_alert|
    expect(@alert.dark).to have_text expect_alert 
end
