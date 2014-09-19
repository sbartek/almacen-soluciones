require 'rails_helper'

RSpec.describe "proyectos/edit", :type => :view do
  before(:each) do
    @proyecto = assign(:proyecto, Proyecto.create!(
      :nombre => "MyString"
    ))
  end

  it "renders the edit proyecto form" do
    render

    assert_select "form[action=?][method=?]", proyecto_path(@proyecto), "post" do

      assert_select "input#proyecto_nombre[name=?]", "proyecto[nombre]"
    end
  end
end
