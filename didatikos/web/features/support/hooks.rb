Before do
  @alert = Alert.new
  @filter = Filter.new
  @login_page = LoginPage.new
  @alunos_page = AlunosPage.new
  @quadro_aulas_page = QuadroAulasPage.new
  @rede_page = RedePage.new
  @colaboradores_page = ColaboradoresPage.new
end

After do
  temp_shot = page.save_screenshot("logs/temp_screenchost.png")

  Allure.add_attachment(
    name: "Screenshot",
    type: Allure::ContentType::PNG,
    source: File.open(temp_shot),
  )
  Capybara.reset_sessions!
end
