Dado('que acesso a página de cadastro') do
    visit "/signup"
end

Quando('submeto o seguinte formulário de cadastro:') do |table|

    log table.hashes
    
    user = table.hashes.first

    log user

    MongoDB.new.remove_user(user[:email])

    find("#fullName").set user[:nome]
    find("#email").set user[:email]
    find('#password').set user[:senha]

    click_button "Cadastrar"
end

Quando('submeto o meu cadastro sem o nome') do
    find("#email").set "fernando@gmail.com"
    find("#password").set "pwd123"

    click_button "Cadastrar"
end

Quando('submeto o meu cadastro sem o email') do
    find("#fullName").set "João Naves"
    find("#password").set "pwd123"

    click_button "Cadastrar"
end


Quando('submeto o meu cadastro com incorreto') do
    find("#fullName").set "João Naves"
    find("#email").set "joaonaves*gmail.com"
    find("#password").set "pwd123"

    click_button "Cadastrar"
end

Quando('submeto o meu cadastro sem a senha') do
    find("#fullName").set "João Naves"
    find("#email").set "joaonaves@gmail.com"

    click_button "Cadastrar"
end

