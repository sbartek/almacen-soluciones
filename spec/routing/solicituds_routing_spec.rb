require "rails_helper"

RSpec.describe SolicitudsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/solicituds").to route_to("solicituds#index")
    end

    it "routes to #new" do
      expect(:get => "/solicituds/new").to route_to("solicituds#new")
    end

    it "routes to #show" do
      expect(:get => "/solicituds/1").to route_to("solicituds#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/solicituds/1/edit").to route_to("solicituds#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/solicituds").to route_to("solicituds#create")
    end

    it "routes to #update" do
      expect(:put => "/solicituds/1").to route_to("solicituds#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/solicituds/1").to route_to("solicituds#destroy", :id => "1")
    end

  end
end
