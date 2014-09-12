require 'rails_helper'

RSpec.describe "ubicacions/new", :type => :view do
  before(:each) do
    assign(:ubicacion, Ubicacion.new(
      :codigo => "MyString",
      :nombre => "MyString",
      :ciudad => "MyString"
    ))
  end

  it "renders new ubicacion form" do
    render

    assert_select "form[action=?][method=?]", ubicacions_path, "post" do

      assert_select "input#ubicacion_codigo[name=?]", "ubicacion[codigo]"

      assert_select "input#ubicacion_nombre[name=?]", "ubicacion[nombre]"

      assert_select "input#ubicacion_ciudad[name=?]", "ubicacion[ciudad]"
    end
  end
end
