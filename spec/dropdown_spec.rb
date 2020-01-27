#usar as caixas de seleção "combobox"

describe "Caixa de opções", :dropdown do
  it "item especifico simples" do
    visit "/dropdown"
    select("Loki", from: "dropdown")
    sleep 3 #temporario
  end

  it "item especifico com o find" do
    visit "/dropdown"
    drop = find(".avenger-list")
    drop.find("option", text: "Scott Lang").select_option
    sleep 3 #temporario
  end

  it "qualquer item", :sample do
    visit "/dropdown"
    drop = find(".avenger-list")
    #drop.find("option")
    drop.all("option").sample.select_option  #seleciona randomicamente um nome da lista
  end
end
