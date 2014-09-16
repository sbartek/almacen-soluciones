require "rails_helper"

RSpec.describe NegocioUnidadsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/negocio_unidads").to route_to("negocio_unidads#index")
    end

    it "routes to #new" do
      expect(:get => "/negocio_unidads/new").to route_to("negocio_unidads#new")
    end

    it "routes to #show" do
      expect(:get => "/negocio_unidads/1").to route_to("negocio_unidads#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/negocio_unidads/1/edit").to route_to("negocio_unidads#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/negocio_unidads").to route_to("negocio_unidads#create")
    end

    it "routes to #update" do
      expect(:put => "/negocio_unidads/1").to route_to("negocio_unidads#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/negocio_unidads/1").to route_to("negocio_unidads#destroy", :id => "1")
    end

  end
end
