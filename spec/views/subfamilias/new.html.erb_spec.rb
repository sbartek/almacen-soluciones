require 'rails_helper'

RSpec.describe "subfamilias/new", :type => :view do
  before(:each) do
    assign(:subfamilia, Subfamilia.new(
      :nombre => "MyString",
      :familia => nil
    ))
  end

  it "renders new subfamilia form" do
    render

    assert_select "form[action=?][method=?]", subfamilias_path, "post" do

      assert_select "input#subfamilia_nombre[name=?]", "subfamilia[nombre]"

      assert_select "input#subfamilia_familia_id[name=?]", "subfamilia[familia_id]"
    end
  end
end
