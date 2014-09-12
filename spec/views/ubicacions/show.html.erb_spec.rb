require 'rails_helper'

RSpec.describe "ubicacions/show", :type => :view do
  before(:each) do
    @ubicacion = assign(:ubicacion, Ubicacion.create!(
      :codigo => "Codigo",
      :nombre => "Nombre",
      :ciudad => "Ciudad"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Codigo/)
    expect(rendered).to match(/Nombre/)
    expect(rendered).to match(/Ciudad/)
  end
end
