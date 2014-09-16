require 'rails_helper'

RSpec.describe "familias/new", :type => :view do
  before(:each) do
    assign(:familia, Familia.new(
      :nombre => "MyString",
      :negocio_unidad => nil
    ))
  end

  it "renders new familia form" do
    render

    assert_select "form[action=?][method=?]", familias_path, "post" do

      assert_select "input#familia_nombre[name=?]", "familia[nombre]"

      assert_select "input#familia_negocio_unidad_id[name=?]", "familia[negocio_unidad_id]"
    end
  end
end
