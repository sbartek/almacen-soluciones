require 'rails_helper'

RSpec.describe "negocio_unidads/show", :type => :view do
  before(:each) do
    @negocio_unidad = assign(:negocio_unidad, NegocioUnidad.create!(
      :nombre => "Nombre"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre/)
  end
end
