require 'rails_helper'

RSpec.describe "proveedors/edit", :type => :view do
  before(:each) do
    @proveedor = assign(:proveedor, Proveedor.create!(
      :nombre => "MyString"
    ))
  end

  it "renders the edit proveedor form" do
    render

    assert_select "form[action=?][method=?]", proveedor_path(@proveedor), "post" do

      assert_select "input#proveedor_nombre[name=?]", "proveedor[nombre]"
    end
  end
end
