require 'rails_helper'

RSpec.describe "subfamilias/show", :type => :view do
  before(:each) do
    @subfamilia = assign(:subfamilia, Subfamilia.create!(
      :nombre => "Nombre",
      :familia => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre/)
    expect(rendered).to match(//)
  end
end
