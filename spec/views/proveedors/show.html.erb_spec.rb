require 'rails_helper'

RSpec.describe "proveedors/show", :type => :view do
  before(:each) do
    @proveedor = assign(:proveedor, Proveedor.create!(
      :nombre => "Nombre"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre/)
  end
end
