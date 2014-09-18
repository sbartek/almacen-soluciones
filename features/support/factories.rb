# -*- coding: utf-8 -*-
require 'factory_girl'
 
FactoryGirl.define do

  factory :negocio_unidad do
    nombre "Energía Nuclear"
  end

  factory :familia do
    nombre "Fontanería Espacial"
    negocio_unidad FactoryGirl.create(:negocio_unidad)
  end

  factory :subfamilia do
    nombre "Metaaccesorios"
    familia FactoryGirl.create(:familia)
  end

  factory :ficha do
    nombre "Tornillo"
    codigo "9000000001"
    subfamilias [FactoryGirl.create(:subfamilia)]
  end

   factory :ubicacion do 
     codigo "0000000000"
     nombre "XXX - 000000 - 0"                     
     ciudad "XXX"
   end

   factory :material do
     cantidad 102
     ubicacion FactoryGirl.create(:ubicacion)
     ficha FactoryGirl.create(:ficha)
   end
end
