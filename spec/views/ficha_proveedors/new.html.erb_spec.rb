require 'rails_helper'

RSpec.describe "ficha_proveedors/new", :type => :view do
  before(:each) do
    assign(:ficha_proveedor, FichaProveedor.new(
      :nombre => "MyString",
      :codigo => "MyString",
      :precio => "9.99",
      :ficha => nil
    ))
  end

  it "renders new ficha_proveedor form" do
    render

    assert_select "form[action=?][method=?]", ficha_proveedors_path, "post" do

      assert_select "input#ficha_proveedor_nombre[name=?]", "ficha_proveedor[nombre]"

      assert_select "input#ficha_proveedor_codigo[name=?]", "ficha_proveedor[codigo]"

      assert_select "input#ficha_proveedor_precio[name=?]", "ficha_proveedor[precio]"

      assert_select "input#ficha_proveedor_ficha_id[name=?]", "ficha_proveedor[ficha_id]"
    end
  end
end
