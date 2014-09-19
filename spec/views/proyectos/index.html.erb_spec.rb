require 'rails_helper'

RSpec.describe "proyectos/index", :type => :view do
  before(:each) do
    assign(:proyectos, [
      Proyecto.create!(
        :nombre => "Nombre"
      ),
      Proyecto.create!(
        :nombre => "Nombre"
      )
    ])
  end

  it "renders a list of proyectos" do
    render
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
  end
end
