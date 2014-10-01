require 'rails_helper'

RSpec.describe "Solicituds", :type => :request do
  before {
    @usuario = FactoryGirl.create(:usuario)
    @proyecto = FactoryGirl.create(:proyecto)
  }

  describe "new solicitud" do
    it "creates solicitud with the 'fecha' of today" do
      visit solicituds_path
      click_link "Nueva solicitud"
      fill_in('Descripcion', :with => 'Ala ma kota.')
      click_on "Create Solicitud"
      #save_and_open_pageA
      expect(Date.parse(find(:xpath, "//p[contains(./strong/text(),'Fecha:')]/text()[2]").text)).to eq(Time.now.to_date)
    end
  end

end
