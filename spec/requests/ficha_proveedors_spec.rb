require 'rails_helper'

RSpec.describe "FichaProveedors", :type => :request do
  describe "GET /ficha_proveedors" do
    it "works! (now write some real specs)" do
      get ficha_proveedors_path
      expect(response).to have_http_status(200)
    end
  end
end
