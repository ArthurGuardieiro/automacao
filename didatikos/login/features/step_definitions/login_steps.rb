Dado('que acesso a página de login') do
    visit "https://didatikos-hmg.didatikos.com.br/ava/login"
end
  
Quando('submeto o meu login correto') do
    find('#email').set "admin@ditatikos.com"
    find('#password').set "didatikos@1010"

    click_button "Login"

end
  
Então('sou redirecionado para o Dashboard') do
    expect(page).to have_css ".app-body"
end