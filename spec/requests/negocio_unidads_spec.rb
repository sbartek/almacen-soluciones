require 'rails_helper'

RSpec.describe "NegocioUnidads", :type => :request do
  describe "GET /negocio_unidads" do
    it "works! (now write some real specs)" do
      get negocio_unidads_path
      expect(response).to have_http_status(200)
    end
  end
end
