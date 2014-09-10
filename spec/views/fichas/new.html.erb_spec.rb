require 'rails_helper'

RSpec.describe "fichas/new", :type => :view do
  before(:each) do
    assign(:ficha, Ficha.new(
      :nombre => "MyString",
      :codigo => "MyString"
    ))
  end

  it "renders new ficha form" do
    render

    assert_select "form[action=?][method=?]", fichas_path, "post" do

      assert_select "input#ficha_nombre[name=?]", "ficha[nombre]"

      assert_select "input#ficha_codigo[name=?]", "ficha[codigo]"
    end
  end
end
