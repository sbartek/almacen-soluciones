require 'rails_helper'

RSpec.describe "ficha_proveedors/index", :type => :view do
  before(:each) do
    assign(:ficha_proveedors, [
      FichaProveedor.create!(
        :nombre => "Nombre",
        :codigo => "Codigo",
        :precio => "9.99",
        :ficha => nil
      ),
      FichaProveedor.create!(
        :nombre => "Nombre",
        :codigo => "Codigo",
        :precio => "9.99",
        :ficha => nil
      )
    ])
  end

  it "renders a list of ficha_proveedors" do
    render
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
    assert_select "tr>td", :text => "Codigo".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
