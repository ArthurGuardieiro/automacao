Before do
  @login_page = LoginPage.new
  @alert = Alert.new
  @signup_page = SignupPage.new
  @equipos_page = EquiposPage.new
  @dash_page = DashPage.new

  #page.driver.browser.manage.window.maximize
  page.current_window.resize_to(1440, 900)
end
