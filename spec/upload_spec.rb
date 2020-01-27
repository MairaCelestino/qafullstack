describe "Upload", :upload do
  before(:each) do
    visit "/upload"

    #PDW um metodo que retorna um caminho na qual eu tenho um diretorio de execução do meu projeto

    @arquivo = Dir.pwd + "/spec/fixtures/arquivo.txt"
    @imagem = Dir.pwd + "/spec/fixtures/imagem.jpg"
  end

  it "Upload com arquivo texto" do
    #puts @arquivo      #puts comando para imprimir algo na tela
    attach_file("file-upload", @arquivo)     #testar com firefox no MAC
    click_button "Upload"

    div_arquivo = find("#uploaded-file")
    expect(div_arquivo.text).to eql "arquivo.txt"
  end

  #CARREGA A IMAGEM!!!
  it "Upload de imagem", :upload_imagem do
    attach_file("file-upload", @imagem)     #testar com firefox no MAC
    click_button "Upload"

    #VERIFICA QUE A IMAGEM  FOI CARREGADA COM SUCESSO!
    #puts Capybara.default_max_wait_time

    #sleep 5
    img = find("#new-image")
    expect(img[:src]).to include "/uploads/imagem.jpg"
  end

  after(:each) do
    sleep 3
  end
end
