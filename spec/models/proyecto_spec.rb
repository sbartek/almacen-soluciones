require 'rails_helper'

RSpec.describe Proyecto, :type => :model do
  let(:proyecto) { FactoryGirl.create(:proyecto)}
  subject { proyecto }
  it { should respond_to :nombre }
end
