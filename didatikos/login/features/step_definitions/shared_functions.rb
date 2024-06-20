def login(email, senha) 
    find("#email").set email
    find("#password").set senha

    click_button "Login"
end