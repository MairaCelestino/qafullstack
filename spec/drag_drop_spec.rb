describe "Drag and Drop", :drop do
  before(:each) do
    visit "/drag_and_drop"
  end

  it "homem aranha pertence ao time do stark " do
    stark = find(".team-stark .column")
    cap = find(".team-cap .column")   #verifica se o homem aranha está no team cap

    spiderman = find("img[alt$=Aranha]")
    spiderman.drag_to stark

    expect(stark).to have_css "img[alt$=Aranha]" #verifica se contem o homem aranha no team do stark
    expect(cap).not_to have_css "img[alt$=Aranha]" #verifica se o homem aranha foi removido do team cap

    sleep 5
  end
end
