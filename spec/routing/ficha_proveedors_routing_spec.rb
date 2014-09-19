require "rails_helper"

RSpec.describe FichaProveedorsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/ficha_proveedors").to route_to("ficha_proveedors#index")
    end

    it "routes to #new" do
      expect(:get => "/ficha_proveedors/new").to route_to("ficha_proveedors#new")
    end

    it "routes to #show" do
      expect(:get => "/ficha_proveedors/1").to route_to("ficha_proveedors#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/ficha_proveedors/1/edit").to route_to("ficha_proveedors#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/ficha_proveedors").to route_to("ficha_proveedors#create")
    end

    it "routes to #update" do
      expect(:put => "/ficha_proveedors/1").to route_to("ficha_proveedors#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/ficha_proveedors/1").to route_to("ficha_proveedors#destroy", :id => "1")
    end

  end
end
