require 'rails_helper'

RSpec.describe "materials/edit", :type => :view do
  before(:each) do
    @material = assign(:material, Material.create!(
      :cantidad => 1,
      :ficha => nil,
      :ubicacion => nil
    ))
  end

  it "renders the edit material form" do
    render

    assert_select "form[action=?][method=?]", material_path(@material), "post" do

      assert_select "input#material_cantidad[name=?]", "material[cantidad]"

      assert_select "input#material_ficha_id[name=?]", "material[ficha_id]"

      assert_select "input#material_ubicacion_id[name=?]", "material[ubicacion_id]"
    end
  end
end
