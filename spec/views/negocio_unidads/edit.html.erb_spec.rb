require 'rails_helper'

RSpec.describe "negocio_unidads/edit", :type => :view do
  before(:each) do
    @negocio_unidad = assign(:negocio_unidad, NegocioUnidad.create!(
      :nombre => "MyString"
    ))
  end

  it "renders the edit negocio_unidad form" do
    render

    assert_select "form[action=?][method=?]", negocio_unidad_path(@negocio_unidad), "post" do

      assert_select "input#negocio_unidad_nombre[name=?]", "negocio_unidad[nombre]"
    end
  end
end
