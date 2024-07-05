class LoginPage
    include Capybara::DSL

    def open
        visit "/"
    end

    def with(email, password)
        find("#email").set email
        find("#password").set password
        click_button "Login"
    end

end