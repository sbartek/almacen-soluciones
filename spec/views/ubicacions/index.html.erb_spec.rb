require 'rails_helper'

RSpec.describe "ubicacions/index", :type => :view do
  before(:each) do
    assign(:ubicacions, [
      Ubicacion.create!(
        :codigo => "Codigo",
        :nombre => "Nombre",
        :ciudad => "Ciudad"
      ),
      Ubicacion.create!(
        :codigo => "Codigo",
        :nombre => "Nombre",
        :ciudad => "Ciudad"
      )
    ])
  end

  it "renders a list of ubicacions" do
    render
    assert_select "tr>td", :text => "Codigo".to_s, :count => 2
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
    assert_select "tr>td", :text => "Ciudad".to_s, :count => 2
  end
end
