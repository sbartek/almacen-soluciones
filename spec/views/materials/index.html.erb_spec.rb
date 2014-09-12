require 'rails_helper'

RSpec.describe "materials/index", :type => :view do
  before(:each) do
    assign(:materials, [
      Material.create!(
        :cantidad => 1,
        :ficha => nil,
        :ubicacion => nil
      ),
      Material.create!(
        :cantidad => 1,
        :ficha => nil,
        :ubicacion => nil
      )
    ])
  end

  it "renders a list of materials" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
