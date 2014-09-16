require 'rails_helper'

RSpec.describe "negocio_unidads/new", :type => :view do
  before(:each) do
    assign(:negocio_unidad, NegocioUnidad.new(
      :nombre => "MyString"
    ))
  end

  it "renders new negocio_unidad form" do
    render

    assert_select "form[action=?][method=?]", negocio_unidads_path, "post" do

      assert_select "input#negocio_unidad_nombre[name=?]", "negocio_unidad[nombre]"
    end
  end
end
