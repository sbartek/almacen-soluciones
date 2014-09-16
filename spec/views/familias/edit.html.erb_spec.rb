require 'rails_helper'

RSpec.describe "familias/edit", :type => :view do
  before(:each) do
    @familia = assign(:familia, Familia.create!(
      :nombre => "MyString",
      :negocio_unidad => nil
    ))
  end

  it "renders the edit familia form" do
    render

    assert_select "form[action=?][method=?]", familia_path(@familia), "post" do

      assert_select "input#familia_nombre[name=?]", "familia[nombre]"

      assert_select "input#familia_negocio_unidad_id[name=?]", "familia[negocio_unidad_id]"
    end
  end
end
