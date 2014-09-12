require 'rails_helper'

RSpec.describe "materials/show", :type => :view do
  before(:each) do
    @material = assign(:material, Material.create!(
      :cantidad => 1,
      :ficha => nil,
      :ubicacion => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
