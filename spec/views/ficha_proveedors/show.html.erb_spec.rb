require 'rails_helper'

RSpec.describe "ficha_proveedors/show", :type => :view do
  before(:each) do
    @ficha_proveedor = assign(:ficha_proveedor, FichaProveedor.create!(
      :nombre => "Nombre",
      :codigo => "Codigo",
      :precio => "9.99",
      :ficha => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre/)
    expect(rendered).to match(/Codigo/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
  end
end
