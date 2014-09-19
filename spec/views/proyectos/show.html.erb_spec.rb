require 'rails_helper'

RSpec.describe "proyectos/show", :type => :view do
  before(:each) do
    @proyecto = assign(:proyecto, Proyecto.create!(
      :nombre => "Nombre"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre/)
  end
end
