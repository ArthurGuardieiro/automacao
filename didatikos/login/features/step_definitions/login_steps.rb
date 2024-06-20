Dado('que acesso a página de login') do
    visit "https://didatikos-hmg.didatikos.com.br/ava/login"
end
  
Quando('submeto o seguinte formulário de cadastro:') do |table|
    
    user = table.hashes.first

    find("#email").set user[:email]
    find("#password").set user[:senha]

    click_button "Login"

end
  
Então('sou redirecionado para o Dashboard') do
    expect(page).to have_css ".app-body"
end

Quando('submeto o meu login sem o email') do
    find('#password').set "pwd123"

    click_button "Login"
end
  
Então('vejo a mensagem de alerta: {string}') do |expect_alert|
    alert = find(:xpath, '//*[@id="login-form"]/div[2]/div[1]/ul/li')
    expect(alert.text).to eql expect_alert
end


Quando('submeto o meu login sem a senha') do
    find('#email').set "admin@ditatikos.com"

    click_button "Login"
end