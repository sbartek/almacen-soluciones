require 'rails_helper'

RSpec.describe "subfamilias/edit", :type => :view do
  before(:each) do
    @subfamilia = assign(:subfamilia, Subfamilia.create!(
      :nombre => "MyString",
      :familia => nil
    ))
  end

  it "renders the edit subfamilia form" do
    render

    assert_select "form[action=?][method=?]", subfamilia_path(@subfamilia), "post" do

      assert_select "input#subfamilia_nombre[name=?]", "subfamilia[nombre]"

      assert_select "input#subfamilia_familia_id[name=?]", "subfamilia[familia_id]"
    end
  end
end
