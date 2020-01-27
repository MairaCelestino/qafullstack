require "capybara"
require "capybara/rspec"
require "selenium-webdriver"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.include Capybara::DSL

  #RENDERIZA PAGINA
  config.before(:example) do
    page.current_window.resize_to(1920, 1080)
  end

  #TIRA SCREENSHOT
  config.after(:example) do |e|
    #after(:each) do |e|
    nome = e.description.gsub(/[^A-Za-z0-9 ]/, "").tr(" ", "_")
    page.save_screenshot("log/" + nome + ".png") #if e.exception # if e.exception tira screem somente do teste que falhou
    #puts e.exception
  end
end

Capybara.configure do |config|
  config.default_driver = :selenium_chrome_headless #executa sem abrir o navegador
  #config.default_driver = :selenium_chrome #chrome
  #config.default_driver = :selenium  #firefox
  config.default_max_wait_time = 15  #substitui o sleep / tem até 5 seg para encontrar o elemento
  config.app_host = "http://training-wheels-protocol.herokuapp.com"    #é chamado esse confif atraves do comando visit
end
