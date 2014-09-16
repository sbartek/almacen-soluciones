require 'rails_helper'

RSpec.describe "Subfamilias", :type => :request do
  describe "GET /subfamilias" do
    it "works! (now write some real specs)" do
      get subfamilias_path
      expect(response).to have_http_status(200)
    end
  end
end
