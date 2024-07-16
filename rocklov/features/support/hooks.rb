Before do
  @login_page = LoginPage.new
  @alert = Alert.new
  @signup_page = SignupPage.new
  @equipos_page = EquiposPage.new
  @dash_page = DashPage.new

  #page.driver.browser.manage.window.maximize
  page.current_window.resize_to(1440, 900)
end

After do
  temp_shot = page.save_screenshot("logs/temp_screenchost.png")

  Allure.add_attachment(
    name: "Screenshot",
    type: Allure::ContentType::PNG,
    source: File.open(temp_shot),
  )
end
