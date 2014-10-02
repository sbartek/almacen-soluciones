require 'rails_helper'

RSpec.describe FichaProveedor, :type => :model do
  
  let(:ficha_proveedor) { FactoryGirl.create(:ficha_proveedor)}
  subject { ficha_proveedor }

  it { should respond_to :nombre }
end
