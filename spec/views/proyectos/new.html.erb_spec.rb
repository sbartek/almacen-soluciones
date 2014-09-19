require 'rails_helper'

RSpec.describe "proyectos/new", :type => :view do
  before(:each) do
    assign(:proyecto, Proyecto.new(
      :nombre => "MyString"
    ))
  end

  it "renders new proyecto form" do
    render

    assert_select "form[action=?][method=?]", proyectos_path, "post" do

      assert_select "input#proyecto_nombre[name=?]", "proyecto[nombre]"
    end
  end
end
