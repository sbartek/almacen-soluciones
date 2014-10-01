require 'rails_helper'

RSpec.describe PrecioHelper, :type => :helper do
  describe "#precio_antonio" do
    describe "when the argument is nil" do
      it "should return nil" do
        expect(precio_antonio(nil)).to be(nil)
      end
    end
    describe "when the argument less then 200" do
      it "should round to up to 2 decimals" do
        expect(precio_antonio(100)).to eq(100)
        expect(precio_antonio(10.4)).to eq(10.4)
        expect(precio_antonio(10.55)).to eq(10.55)
        expect(precio_antonio(10.554)).to eq(10.55)
        expect(precio_antonio(10.555)).to eq(10.56)
      end
    end
    describe "when the argument greater or equal then 200" do
      it "should round to integer" do
        expect(precio_antonio(200)).to eq(200)
        expect(precio_antonio(210.4)).to eq(210)
        expect(precio_antonio(210.55)).to eq(211)
        expect(precio_antonio(210.5)).to eq(211)
      end
    end

  end
end
