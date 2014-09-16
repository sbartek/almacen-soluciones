require "rails_helper"

RSpec.describe SubfamiliasController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/subfamilias").to route_to("subfamilias#index")
    end

    it "routes to #new" do
      expect(:get => "/subfamilias/new").to route_to("subfamilias#new")
    end

    it "routes to #show" do
      expect(:get => "/subfamilias/1").to route_to("subfamilias#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/subfamilias/1/edit").to route_to("subfamilias#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/subfamilias").to route_to("subfamilias#create")
    end

    it "routes to #update" do
      expect(:put => "/subfamilias/1").to route_to("subfamilias#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/subfamilias/1").to route_to("subfamilias#destroy", :id => "1")
    end

  end
end
