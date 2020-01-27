describe "tabelas", :tabs, :smoke do
  before(:each) do
    visit "/tables"
  end

  # it "pega o tony stark na lista" do
  #  expect(page).to have_content "Robert Downey Jr"
  #sleep 5
  #end

  it "deve exibir o salario do stark " do
    atores = all("table tbody tr")
    stark = atores.detect { |ator| ator.text.include?("Robert Downey Jr") }
    puts stark.text

    expect(stark.text).to include "10.000.000"

    sleep 1
  end

  it "deve exibir o salario do vin diesel" do
    diesel = find("table tbody tr", text: "@vindiesel")
    expect(diesel).to have_content "10.000.000"

    puts diesel.text

    sleep 1
  end

  it "deve exibir o filme velozes" do
    diesel = find("table tbody tr", text: "@vindiesel")

    movie = diesel.all("td")[2].text
    #expect(movie).to eql "Fast & Furious"
    expect(movie).to eql "Velozes e Furiosos"

    puts movie
    sleep 1
  end

  it "deve exibir do instagram do Chris Evans" do
    evans = find("table tbody tr", text: "Chris Evans")
    insta = evans.all("td")[4].text
    expect(insta).to eql "@teamcevans"

    puts insta
  end

  it "deve selecionar Chris Prat para remoção" do
    prat = find("table tbody tr", text: "Chris Prat")
    prat.find("a", text: "delete").click

    msg = page.driver.browser.switch_to.alert.text

    expect(msg).to eql "Chris Pratt foi selecionado para remoção!"

    puts msg
  end

  it "deve selecionar Chris Prat para edição" do
    prat = find("table tbody tr", text: "Chris Prat")
    prat.find("a", text: "edit").click

    msg = page.driver.browser.switch_to.alert.text

    expect(msg).to eql "Chris Pratt foi selecionado para edição!"

    puts msg
  end
end
