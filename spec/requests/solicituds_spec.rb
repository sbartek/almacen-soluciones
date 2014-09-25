require 'rails_helper'

RSpec.describe "Solicituds", :type => :request do
  describe "GET /solicituds" do
    it "works! (now write some real specs)" do
      get solicituds_path
      expect(response).to have_http_status(200)
    end
  end
end
