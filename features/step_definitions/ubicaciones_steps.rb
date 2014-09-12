# -*- coding: utf-8 -*-
Dado(/^tabla de ubicaciones:$/) do |table|
  table.hashes.each do |attributes|
    FactoryGirl.create(:ubicacion, attributes)
  end
end
