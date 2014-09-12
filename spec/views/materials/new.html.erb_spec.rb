require 'rails_helper'

RSpec.describe "materials/new", :type => :view do
  before(:each) do
    assign(:material, Material.new(
      :cantidad => 1,
      :ficha => nil,
      :ubicacion => nil
    ))
  end

  it "renders new material form" do
    render

    assert_select "form[action=?][method=?]", materials_path, "post" do

      assert_select "input#material_cantidad[name=?]", "material[cantidad]"

      assert_select "input#material_ficha_id[name=?]", "material[ficha_id]"

      assert_select "input#material_ubicacion_id[name=?]", "material[ubicacion_id]"
    end
  end
end
