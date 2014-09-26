require 'rails_helper'

RSpec.describe Solicitud, :type => :model do
  before {
    @solicitud = FactoryGirl.create(:solicitud)
  }

  subject { @solicitud }

  it {should respond_to(:fecha)}
  it {should respond_to(:fecha_limite)}

  describe "when usuario is not present" do
    before { @solicitud.usuario = nil }
    it { should_not be_valid }
  end

  describe "when proyecto is not present" do
    before { @solicitud.proyecto = nil }
    it { should_not be_valid }
  end

  describe "#descripcion" do

    describe "when is too short (<11)" do
      before { @solicitud.descripcion = "Ala ma ko." }
      it { should_not be_valid }
    end
    
    describe "when is long as much as it can (=1200)" do
      before { @solicitud.descripcion = "Ala ma ko."*120 }
      it { should be_valid }
    end


    describe "when is too long (>1200)" do
      before { @solicitud.descripcion = "Ala ma ko."*120+"!" }
      it { should_not be_valid }
    end

    describe "when has more then 13 \\n" do
      before { @solicitud.descripcion = "Ala\n"*14 }
      it { should_not be_valid }
    end


  end


end
