describe "IDs Dinâmicos", :id_dinamicos do
  before(:each) do
    visit "/login2"
  end
  #Tratamento de ID Dinâmico
  it "cadastro" do
    #find("#PortalTheme_wt10_block_wtcontent_holder_wt8_wtUsernameInput").set "fernando"
    find("input[id$=UsernameInput]").set "fernando"   #outra maneira  # $ termina com
    #find("#PasswordInput_wt11_PortalTheme_wt7_block_wtcontent_holder_wt8_wt").set "123456"
    find("input[id^=PasswordInput]").set "123456"  # ^ começa com
    #find("#PortalTheme_wt4_block_wtGetStartedButton_wtcontent_holder_OSCore_wt3_block").click
    find("a[id*=GetStartedButton]").click     # * contem

    expect(page).to have_content "Dados enviados. Aguarde aprovação do seu cadastro!"  #Verifica se a mensagem existe

    sleep 3
  end
end

#select elemento * from html where id like '%UsernameInput%'
