require 'rails_helper'

RSpec.describe "fichas/index", :type => :view do
  before(:each) do
    assign(:fichas, [
      Ficha.create!(
        :nombre => "Nombre",
        :codigo => "Codigo"
      ),
      Ficha.create!(
        :nombre => "Nombre",
        :codigo => "Codigo"
      )
    ])
  end

  it "renders a list of fichas" do
    render
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
    assert_select "tr>td", :text => "Codigo".to_s, :count => 2
  end
end
