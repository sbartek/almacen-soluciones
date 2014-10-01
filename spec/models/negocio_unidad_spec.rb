require 'rails_helper'

RSpec.describe NegocioUnidad, :type => :model do
  let (:unidad) {
    FactoryGirl.create(:negocio_unidad)
  }
  subject { unidad }


  it {should respond_to{:familias}}

  it {should respond_to(:subfamilias)}

  it {should respond_to(:nombre)}

  describe "#subfamilias" do
    before {
      familia1 = FactoryGirl.create(:familia, nombre: "Familia1", negocio_unidad: unidad)
      familia2 = FactoryGirl.create(:familia, nombre: "Familia2", negocio_unidad: unidad)
      @subfamilia1a = FactoryGirl.create(:subfamilia, nombre: "Subfamilia1a", familia: familia1 )
      @subfamilia1b = FactoryGirl.create(:subfamilia, nombre: "Subfamilia1b", familia: familia1 )
      @subfamilia2 = FactoryGirl.create(:subfamilia, nombre: "Subfamilia2", familia: familia2)
    }

    its(:subfamilias) { should match_array([@subfamilia1a, @subfamilia1b, @subfamilia2] ) }
  end
end
