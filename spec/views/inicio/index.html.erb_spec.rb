require 'rails_helper'

RSpec.describe "inicio/index.html.erb", :type => :view do

  it "deberia tener link al pagina de incio" do
    visit '/'
    expect(page).to have_link('Almacen')
    click_link('Almacen')
    expect(page).to have_link('Almacen')
  end

end
