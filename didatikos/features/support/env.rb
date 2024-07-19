require "capybara"
require "capybara/cucumber"
require "faker"
require "allure-cucumber"
require "rspec"

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.default_max_wait_time = 15
  config.app_host = "https://didatikos-hmg.didatikos.com.br/ava"
end

AllureCucumber.configure do |config|
  config.results_directory = "/logs"
  config.clean_results_directory = true
end

RSpec.configure do |config|
  # Configuração padrão: não parar nos primeiros erros
  config.fail_fast = false
end
