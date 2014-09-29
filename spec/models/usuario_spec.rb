require 'rails_helper'

RSpec.describe Usuario, :type => :model do

  before { 
    @usuario = FactoryGirl.create(:usuario, 
                                   {nombre: "Jorge", 
                                     email: "jorge@ejemplo.com",
                                     password: "test01",
                                     password_confirmation: "test01"
                                   }) 
  }

  subject { @usuario }

  describe "when password is not present" do
    before do
      @usuario.password = " "
      @usuario.password_confirmation = " "
    end
    it { should_not be_valid }
  end
  
  it { should respond_to(:nombre) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }

  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  it { should be_valid }
   
  describe "nombre" do
    describe "when nombre is not present" do
      before { @usuario.nombre = " " }
      it { should_not be_valid }
    end
  
    describe "when #nombre is too long" do
      before { @usuario.nombre = "a" * 51 }
      it { should_not be_valid }
    end

    describe "when is too short" do
      before { @usuario.nombre = "a" * 3 }
      it { should_not be_valid }
    end

  end
  
  describe "email" do

    describe "when is not present" do
      before { @usuario.email = " " }
      it { should_not be_valid }
    end

    describe "when its format is invalid" do
      it "should be invalid" do
        addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
        addresses.each do |invalid_address|
          @usuario.email = invalid_address
          expect(@usuario).not_to be_valid
        end
      end
    end

    describe "when its format is valid" do
      it "should be valid" do
        addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
        addresses.each do |valid_address|
          @usuario.email = valid_address
          expect(@usuario).to be_valid
        end
      end
    end

    describe "when is already taken" do
      before do
        @usuario_with_same_email = FactoryGirl.create(:usuario) 
        @usuario_with_same_email.email = "jorge@ejemplo.com"
      end
      
      it "should not be valid" do
        expect(@usuario_with_same_email).not_to be_valid
      end
    end
  end
  
  describe "password" do
    describe "when is not present" do
      before do
        @usuario.password = @usuario.password_confirmation = " "
      end
      it { should_not be_valid }
    end

    describe "when doesn't match confirmation" do
      before { @usuario.password_confirmation = "mismatch" }
      it { should_not be_valid }
    end
    
    describe "when is too short" do
      before { @usuario.password = @usuario.password_confirmation = "a" * 5}
      it { should be_invalid }
    end
  end

  describe "#authenticate" do

    describe "return value" do
      let(:found_user) { Usuario.find_by(email: @usuario.email) }
      
      describe "with valid password" do
        it { should eq found_user.authenticate(@usuario.password) }
      end
      
      describe "with invalid password" do
        let(:user_for_invalid_password) { found_user.authenticate("invalid") }
        subject { user_for_invalid_password }
        
        it { should_not eq @usuario }
        specify { should eq false }
      end
    end

  end
  
end
