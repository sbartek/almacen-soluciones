require 'rails_helper'

RSpec.describe "familias/index", :type => :view do
  before(:each) do
    assign(:familias, [
      Familia.create!(
        :nombre => "Nombre",
        :negocio_unidad => nil
      ),
      Familia.create!(
        :nombre => "Nombre",
        :negocio_unidad => nil
      )
    ])
  end

  it "renders a list of familias" do
    render
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
