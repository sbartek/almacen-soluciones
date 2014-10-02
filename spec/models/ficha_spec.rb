require 'rails_helper'

RSpec.describe Ficha, :type => :model do
  let (:ficha) {FactoryGirl.create(:ficha)}

  subject { ficha }

  it { should respond_to :nombre }
end
