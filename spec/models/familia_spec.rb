require 'rails_helper'

RSpec.describe Familia, :type => :model do
  let (:familia) { FactoryGirl.create(:familia)}
  subject { familia }
  it { should respond_to :subfamilias }
  it { should respond_to :negocio_unidad }
end
