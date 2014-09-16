# -*- coding: utf-8 -*-
Dado(/^tabla de "?unidades de negocio"?:$/) do |table|
  table.hashes.each do |attributes|
    FactoryGirl.create(:negocio_unidad, attributes)
  end
end

Dado(/^tabla de "?familias"?:$/) do |table|
  table.hashes.each do |attributes|
    FactoryGirl.create(:familia, {
                         nombre: attributes[:nombre],
                         negocio_unidad: FactoryGirl.create(:negocio_unidad, {nombre: attributes[:negocio_unidad]})
                       })
  end
end

Dado(/^tabla de "?fubfamilas"?:$/) do |table|
  table.hashes.each do |attributes|
    FactoryGirl.create(:subfamila, {
                         nombre: attributes[:nombre],
                         subfamilia: FactoryGirl.create(:familia, {nombre: attributes[:familia]})
                       })
  end
end
