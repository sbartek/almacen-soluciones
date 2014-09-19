require 'rails_helper'

RSpec.describe "proveedors/index", :type => :view do
  before(:each) do
    assign(:proveedors, [
      Proveedor.create!(
        :nombre => "Nombre"
      ),
      Proveedor.create!(
        :nombre => "Nombre"
      )
    ])
  end

  it "renders a list of proveedors" do
    render
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
  end
end
