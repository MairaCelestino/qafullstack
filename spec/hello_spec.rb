describe "Meu primeiro script", :hello, :smoke do
  #before(:each) do
  # page.current_window.resize_to(1280, 800)
  #end
  it "visitar a pagina" do
    visit "/"
    #puts page.title
    expect(page.title).to eql "Training Wheels Protocol"
    puts page.title
    sleep 3
  end
end
