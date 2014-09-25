require 'rails_helper'

RSpec.describe "solicituds/show", :type => :view do
  before(:each) do
    @solicitud = assign(:solicitud, Solicitud.create!(
      :proyecto => nil,
      :usuario => nil,
      :descripcion => "MyText",
      :prioridad => "Prioridad",
      :notas => "MyText",
      :categoria => "Categoria"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Prioridad/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Categoria/)
  end
end
