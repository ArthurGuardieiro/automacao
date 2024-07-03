require "capybara"
require "capybara/cucumber"
require "faker"



Capybara.configure do |config|
    config.default_driver = :selenium_chrome  
    config.default_max_wait_time = 15
    config.app_host = "https://didatikos-hmg.didatikos.com.br/ava"
end