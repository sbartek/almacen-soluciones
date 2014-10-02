require 'rails_helper'

RSpec.describe Subfamilia, :type => :model do
  let(:subfamilia) { FactoryGirl.create(:subfamilia)}
  subject { subfamilia }
  it { should respond_to :nombre }
  it { should respond_to :familia }
  it { should respond_to :negocio_unidad }
end
