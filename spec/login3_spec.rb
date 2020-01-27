describe "Login com Cadastro", :login3 do
  before(:each) do
    visit "/access"
  end
  it "login com sucesso" do

    #Quando tem um elemento com o mesmo nome ou id,trabalhamos com o escopo (através do elemento Pai que busca os Filhos)
    #login_form = find("#login")
    #login_form.find("input[name=username]").set "stark"
    #login_form.find("input[name=password]").set "jarvis!"
    #find("#userId").set "stark"
    #find("#passId").set "jarvis!"

    #Outra forma de fazer o "Escopo"

    within("#login") do
      find("input[name=username]").set "stark"
      find("input[name=password]").set "jarvis!"
      click_button "Entrar"
    end

    #click_button "Entrar"
    expect(find("#flash").visible?).to be true
    expect(find("#flash")).to have_content "Olá, Tony Stark. Você acessou a área logada!"

    sleep 5
  end

  it "cadastro com sucesso " do
    within("#signup") do
      find("input[name=username]").set "fernando"
      find("input[name=password]").set "123456"
      click_link "Criar Conta"
    end

    expect(page).to have_content "Dados enviados. Aguarde aprovação do seu cadastro!"

    sleep 5
  end
end
