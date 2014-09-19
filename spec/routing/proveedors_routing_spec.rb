require "rails_helper"

RSpec.describe ProveedorsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/proveedors").to route_to("proveedors#index")
    end

    it "routes to #new" do
      expect(:get => "/proveedors/new").to route_to("proveedors#new")
    end

    it "routes to #show" do
      expect(:get => "/proveedors/1").to route_to("proveedors#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/proveedors/1/edit").to route_to("proveedors#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/proveedors").to route_to("proveedors#create")
    end

    it "routes to #update" do
      expect(:put => "/proveedors/1").to route_to("proveedors#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/proveedors/1").to route_to("proveedors#destroy", :id => "1")
    end

  end
end
