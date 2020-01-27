describe "Teclado", :key do
  before(:each) do
    visit "/key_presses"
  end

  it "enviando teclas" do
    teclas = %i[tab escape enter space alt control shift]

    teclas.each do |t|
      find("#campo-id").send_keys t
      expect(page).to have_content "You entered: " + t.to_s.upcase
      sleep 1
    end

    #find("#campo-id").send_keys :tab #enviar um unico simbolo

    #expect(page).to have_content "You entered: TAB"

    #sleep 3
  end

  it "Enviando letras" do
    letras = %w[a s d f g h j k l]

    letras.each do |l|
      find("#campo-id").send_keys l
      expect(page).to have_content "You entered: " + l.to_s.upcase
      sleep 1
    end
  end
end
