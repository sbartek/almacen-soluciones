require 'rails_helper'

RSpec.describe "fichas/edit", :type => :view do
  before(:each) do
    @ficha = assign(:ficha, Ficha.create!(
      :nombre => "MyString",
      :codigo => "MyString"
    ))
  end

  it "renders the edit ficha form" do
    render

    assert_select "form[action=?][method=?]", ficha_path(@ficha), "post" do

      assert_select "input#ficha_nombre[name=?]", "ficha[nombre]"

      assert_select "input#ficha_codigo[name=?]", "ficha[codigo]"
    end
  end
end
