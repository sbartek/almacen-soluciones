# -*- coding: utf-8 -*-
require 'factory_girl'

FactoryGirl.define do

  factory :proveedor do
    nombre "Alexis & Sons"
  end

  factory :negocio_unidad do
    nombre "Energía Nuclear"
  end

  factory :familia do
    nombre "Fontanería Espacial"
    negocio_unidad 
  end

  factory :subfamilia do
    nombre "Metaaccesorios"
    familia 
  end

  factory :ficha do
    nombre "Tornillo"
    codigo "9000000001"
    subfamilias {[FactoryGirl.create(:subfamilia)]}
  end

  factory :ubicacion do 
    codigo "0000000000"
    nombre "XXX - 000000 - 0"                     
    ciudad "XXX"
  end
  
  factory :proyecto do 
    nombre { "Spaceship X #{Random.rand(100000).to_s}" }
  end

  factory :material do
    cantidad 102
    ubicacion
    ficha 
    proyecto #FactoryGirl.create(:proyecto)
  end

  factory :usuario do
    nombre { "Alexis Cisneros#{Random.rand(100000).to_s}" }
    email { "ac#{Random.rand(100000).to_s}@soluciones.com" }
    password "alog apud"
    password_confirmation "alog apud"
    after(:create) do |usuario, evaluator|
      usuario.password_digest = "ALOG APUD"
    end
  end

  factory :solicitud do
    fecha Time.now.to_date
    fecha_limite 2.days.from_now.to_date
    proyecto # FactoryGirl.create(:proyecto)
    usuario # FactoryGirl.create(:usuario)
    descripcion "Ala ma kota.\n"
    prioridad "U"
    notas "Tata rak, mama rak, a tam mamy tatarak."
    categoria "A"
  end

  factory :ficha_proveedor do
    nombre "Tornillo"
    codigo "ALA12345"
    precio 201.5
    ficha
    proveedor
    observaciones "Ala ma dwa koty. Jeden biały, a drugi czerwony."
  end

end
