require 'rails_helper'

RSpec.describe "solicituds/edit", :type => :view do
  before(:each) do
    @solicitud = assign(:solicitud, Solicitud.create!(
      :proyecto => nil,
      :usuario => nil,
      :descripcion => "MyText",
      :prioridad => "MyString",
      :notas => "MyText",
      :categoria => "MyString"
    ))
  end

  it "renders the edit solicitud form" do
    render

    assert_select "form[action=?][method=?]", solicitud_path(@solicitud), "post" do

      assert_select "input#solicitud_proyecto_id[name=?]", "solicitud[proyecto_id]"

      assert_select "input#solicitud_usuario_id[name=?]", "solicitud[usuario_id]"

      assert_select "textarea#solicitud_descripcion[name=?]", "solicitud[descripcion]"

      assert_select "input#solicitud_prioridad[name=?]", "solicitud[prioridad]"

      assert_select "textarea#solicitud_notas[name=?]", "solicitud[notas]"

      assert_select "input#solicitud_categoria[name=?]", "solicitud[categoria]"
    end
  end
end
