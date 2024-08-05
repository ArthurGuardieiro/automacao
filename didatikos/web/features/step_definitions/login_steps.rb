Dado('que acesso a página de login') do
    @login_page.open
end
  
Quando('submeto minhas credenciais com {string} e {string}') do |email, password|
    
    @login_page.with(email, password)

end
  
Então('sou redirecionado para o Dashboard') do
    expect(page).to have_css ".app-body"
end
  
Então('vejo a mensagem de alerta: {string}') do |expect_alert|
    alert = find(:xpath, '//*[@id="login-form"]/div[2]/div[1]/ul/li')
    expect(alert.text).to eql expect_alert
end

