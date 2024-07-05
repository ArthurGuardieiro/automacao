

class EquiposPage
    include Capybara::DSL

    def open
        visit "/equipos"
    end

    def create(anuncio)

        upload(anuncio[:thumb])

        find("input[placeholder$=equipamento]"). set anuncio[:nome]
        find("#category").find('option', text: anuncio[:categoria] ).select_option
        find("input[placeholder^=Valor]").set anuncio[:preco]

        click_button 'Cadastrar'
    end

    def upload(file_name)
        thumb = Dir.pwd + "/features/support/fixtures/images/" + file_name

        find("#thumbnail input[type=file]", visible: false).set thumb
    end


end