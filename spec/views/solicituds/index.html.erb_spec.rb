require 'rails_helper'

RSpec.describe "solicituds/index", :type => :view do
  before(:each) do
    assign(:solicituds, [
      Solicitud.create!(
        :proyecto => nil,
        :usuario => nil,
        :descripcion => "MyText",
        :prioridad => "Prioridad",
        :notas => "MyText",
        :categoria => "Categoria"
      ),
      Solicitud.create!(
        :proyecto => nil,
        :usuario => nil,
        :descripcion => "MyText",
        :prioridad => "Prioridad",
        :notas => "MyText",
        :categoria => "Categoria"
      )
    ])
  end

  it "renders a list of solicituds" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Prioridad".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Categoria".to_s, :count => 2
  end
end
