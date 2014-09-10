require 'rails_helper'

RSpec.describe "fichas/show", :type => :view do
  before(:each) do
    @ficha = assign(:ficha, Ficha.create!(
      :nombre => "Nombre",
      :codigo => "Codigo"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre/)
    expect(rendered).to match(/Codigo/)
  end
end
