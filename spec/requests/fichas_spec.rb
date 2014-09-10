require 'rails_helper'

RSpec.describe "Fichas", :type => :request do
  describe "GET /fichas" do
    it "works! (now write some real specs)" do
      get fichas_path
      expect(response).to have_http_status(200)
    end
  end
end
