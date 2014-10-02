require 'rails_helper'

RSpec.describe Ubicacion, :type => :model do
  let(:ubicacion) { FactoryGirl.create(:ubicacion)}
  subject { ubicacion }
  it { should respond_to :nombre }
end
