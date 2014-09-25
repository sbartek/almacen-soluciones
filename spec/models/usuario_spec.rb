require 'rails_helper'

RSpec.describe Usuario, :type => :model do

  before { @usuario = FactoryGirl.create(:usuario, {nombre: "Jorge Ejemplo", email: "jorge@ejemplo.com"}) }

  subject { @usuario }
  
  it {should respond_to(:nombre)}
  it {should respond_to(:email)}

  it { should be_valid }

  describe "when nombre is not present" do
    before { @usuario.nombre = " " }
    it { should_not be_valid }
  end
  
  describe "when email is not present" do
    before { @usuario.email = " " }
    it { should_not be_valid }
  end

  describe "when #nombre is too long" do
    before { @usuario.nombre = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when #nombre is too short" do
    before { @usuario.nombre = "a" * 3 }
    it { should_not be_valid }
  end
  
  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @usuario.email = invalid_address
        expect(@usuario).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @usuario.email = valid_address
        expect(@usuario).to be_valid
      end
    end
  end
end
