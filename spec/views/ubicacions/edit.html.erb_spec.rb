require 'rails_helper'

RSpec.describe "ubicacions/edit", :type => :view do
  before(:each) do
    @ubicacion = assign(:ubicacion, Ubicacion.create!(
      :codigo => "MyString",
      :nombre => "MyString",
      :ciudad => "MyString"
    ))
  end

  it "renders the edit ubicacion form" do
    render

    assert_select "form[action=?][method=?]", ubicacion_path(@ubicacion), "post" do

      assert_select "input#ubicacion_codigo[name=?]", "ubicacion[codigo]"

      assert_select "input#ubicacion_nombre[name=?]", "ubicacion[nombre]"

      assert_select "input#ubicacion_ciudad[name=?]", "ubicacion[ciudad]"
    end
  end
end
