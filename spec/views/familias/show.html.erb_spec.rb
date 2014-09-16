require 'rails_helper'

RSpec.describe "familias/show", :type => :view do
  before(:each) do
    @familia = assign(:familia, Familia.create!(
      :nombre => "Nombre",
      :negocio_unidad => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre/)
    expect(rendered).to match(//)
  end
end
