describe "Login Forms", :forms, :smoke do
  it "login com sucesso" do
    visit "/login"

    fill_in "userId", with: "stark"       #preenche elementos "username"
    fill_in "passId", with: "jarvis!"     #preenche elementos "password"

    click_button "Login"

    expect(find("#flash").visible?).to be true
    expect(find("#flash")).to have_content "Olá, Tony Stark. Você acessou a área logada!"

    #puts find("#flash").text  #obter texto do elemento "#flash"

    #expect(find("#flash").text).to eql "Olá, Tony Stark. Você acessou a área logada!"           #verifica texto identico

    # puts find('#flash').text
    #puts "Olá, Tony Stark. Você acessou a área logada!"

    #expect(find("#flash").text).to include "Olá, Tony Stark. Você acessou a área logada! # se o valor contem na string ou no elemento posso usar include ou have_content

    #page.save_screenshot("log/login_com_sucesso.png")    #screemshot

    sleep 2
  end
  it "senha incorreta" do
    visit "/login"

    fill_in "userId", with: "stark"       #preenche elementos "username"
    fill_in "passId", with: "xpto123"     #preenche elementos "password"

    click_button "Login"

    expect(find("#flash")).to have_content "Senha é invalida!"

    #page.save_screenshot("log/senha_incorreta.png")    #screemshot

    sleep 2
  end
  it "usuário não cadastrado" do
    visit "/login"

    fill_in "userId", with: "hulk"       #preenche elementos "username"
    fill_in "password", with: "xpto123!"     #preenche elementos "password"

    click_button "Login"

    expect(find("#flash")).to have_content "O usuário informado não está cadastrado!"

    #page.save_screenshot("log/usuario_nao_cadastrado.png")    #screemshot

    sleep 2
  end
  #TIRAR SCREENSHOT
end
