require 'rails_helper'

RSpec.describe "Ubicacions", :type => :request do
  describe "GET /ubicacions" do
    it "works! (now write some real specs)" do
      get ubicacions_path
      expect(response).to have_http_status(200)
    end
  end
end
