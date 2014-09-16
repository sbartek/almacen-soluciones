require 'rails_helper'

RSpec.describe "Familias", :type => :request do
  describe "GET /familias" do
    it "works! (now write some real specs)" do
      get familias_path
      expect(response).to have_http_status(200)
    end
  end
end
