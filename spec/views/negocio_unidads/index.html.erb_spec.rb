require 'rails_helper'

RSpec.describe "negocio_unidads/index", :type => :view do
  before(:each) do
    assign(:negocio_unidads, [
      NegocioUnidad.create!(
        :nombre => "Nombre"
      ),
      NegocioUnidad.create!(
        :nombre => "Nombre"
      )
    ])
  end

  it "renders a list of negocio_unidads" do
    render
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
  end
end
