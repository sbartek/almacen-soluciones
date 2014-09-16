require "rails_helper"

RSpec.describe FamiliasController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/familias").to route_to("familias#index")
    end

    it "routes to #new" do
      expect(:get => "/familias/new").to route_to("familias#new")
    end

    it "routes to #show" do
      expect(:get => "/familias/1").to route_to("familias#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/familias/1/edit").to route_to("familias#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/familias").to route_to("familias#create")
    end

    it "routes to #update" do
      expect(:put => "/familias/1").to route_to("familias#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/familias/1").to route_to("familias#destroy", :id => "1")
    end

  end
end
