 require 'factory_girl'
 
FactoryGirl.define do
   factory :ficha do |ficha|
     ficha.nombre "Tornillo"
     ficha.codigo "9000000001"
   end

   factory :ubicacion do |ubicacion|
     ubicacion.codigo "0000000000"
     ubicacion.nombre "XXX - 000000 - 0"                     
     ubicacion.ciudad "XXX"
   end
end
