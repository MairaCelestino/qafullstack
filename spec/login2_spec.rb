describe "Login 2", :login2 do
  before(:each) do
    visit "/access"
  end
  it "com data de nascimento" do
    #fill_in "userId", with: "stark"       #preenche elementos "username"
    #fill_in "passId", with: "jarvis!"     #preenche elementos "password"
    #click_button "Login"
    #expect(find("#flash").visible?).to be true
    #expect(find("#flash")).to have_content "Olá, Tony Stark. Você acessou a área logada!"

    find("#userId").set "stark"
    find("#passId").set "jarvis!"

    login_form = find("#login")

    case login_form.text
    when /Dia/ #se contem dia, preenche o campo dia
      find("#day").set "29"
    when /Mês/
      find("#month").set "05"
    when /Ano/
      find("#year").set "1970"
    end

    click_button "Login"
    expect(find("#flash").visible?).to be true
    expect(find("#flash")).to have_content "Olá, Tony Stark. Você acessou a área logada!"

    sleep 5
  end
end
