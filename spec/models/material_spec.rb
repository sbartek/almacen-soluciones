require 'rails_helper'

RSpec.describe Material, :type => :model do
  let (:material) { FactoryGirl.create(:material)  }
  subject { material }
  it { should respond_to :ficha }
end
