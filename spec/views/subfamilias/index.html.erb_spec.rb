require 'rails_helper'

RSpec.describe "subfamilias/index", :type => :view do
  before(:each) do
    assign(:subfamilias, [
      Subfamilia.create!(
        :nombre => "Nombre",
        :familia => nil
      ),
      Subfamilia.create!(
        :nombre => "Nombre",
        :familia => nil
      )
    ])
  end

  it "renders a list of subfamilias" do
    render
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
