require 'rails_helper'

RSpec.describe "proveedors/new", :type => :view do
  before(:each) do
    assign(:proveedor, Proveedor.new(
      :nombre => "MyString"
    ))
  end

  it "renders new proveedor form" do
    render

    assert_select "form[action=?][method=?]", proveedors_path, "post" do

      assert_select "input#proveedor_nombre[name=?]", "proveedor[nombre]"
    end
  end
end
