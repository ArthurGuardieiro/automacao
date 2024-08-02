class EquiposPage
  include Capybara::DSL

  def open
    visit "/equipos"
  end

  def create(anuncio)
    upload(anuncio[:thumb]) if anuncio[:thumb].length > 0

    find("input[placeholder$=equipamento]").set anuncio[:nome]

    select_cat(anuncio[:categoria]) if anuncio[:categoria].length > 0

    find("input[placeholder^=Valor]").set anuncio[:preco]

    click_button "Cadastrar"
  end

  def select_cat(cat)
    find("#category").find("option", text: cat).select_option
  end

  def upload(file_name)
    thumb = Dir.pwd + "/features/support/fixtures/images/" + file_name

    find("#thumbnail input[type=file]", visible: false).set thumb
  end
end
