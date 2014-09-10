require "rails_helper"

RSpec.describe FichasController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/fichas").to route_to("fichas#index")
    end

    it "routes to #new" do
      expect(:get => "/fichas/new").to route_to("fichas#new")
    end

    it "routes to #show" do
      expect(:get => "/fichas/1").to route_to("fichas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/fichas/1/edit").to route_to("fichas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/fichas").to route_to("fichas#create")
    end

    it "routes to #update" do
      expect(:put => "/fichas/1").to route_to("fichas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/fichas/1").to route_to("fichas#destroy", :id => "1")
    end

  end
end
