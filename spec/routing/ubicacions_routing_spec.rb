require "rails_helper"

RSpec.describe UbicacionsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/ubicacions").to route_to("ubicacions#index")
    end

    it "routes to #new" do
      expect(:get => "/ubicacions/new").to route_to("ubicacions#new")
    end

    it "routes to #show" do
      expect(:get => "/ubicacions/1").to route_to("ubicacions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/ubicacions/1/edit").to route_to("ubicacions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/ubicacions").to route_to("ubicacions#create")
    end

    it "routes to #update" do
      expect(:put => "/ubicacions/1").to route_to("ubicacions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/ubicacions/1").to route_to("ubicacions#destroy", :id => "1")
    end

  end
end
