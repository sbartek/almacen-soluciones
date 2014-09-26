require 'rails_helper'

RSpec.describe Proveedor, :type => :model do

  before {
    @proveedor = FactoryGirl.create(:proveedor)
  }
  
  subject {
    @proveedor
  }

  it {should respond_to(:nombre)}
  
  describe "#nombre" do
      
    describe "when is not present" do
      before { @proveedor.nombre = " " }
      it { should_not be_valid }
    end
    
    describe "when is already taken" do
      before do
        proveedor_new = FactoryGirl.create(:proveedor, nombre: "Jorge & Brothers")
        @proveedor.nombre = proveedor_new.nombre
      end

      it { should_not be_valid }
    end
  end

end
