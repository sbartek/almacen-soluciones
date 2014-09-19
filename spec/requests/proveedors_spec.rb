require 'rails_helper'

RSpec.describe "Proveedors", :type => :request do
  describe "GET /proveedors" do
    it "works! (now write some real specs)" do
      get proveedors_path
      expect(response).to have_http_status(200)
    end
  end
end
