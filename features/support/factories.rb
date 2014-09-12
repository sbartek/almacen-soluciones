 require 'factory_girl'
 
FactoryGirl.define do
   factory :ficha do
     nombre "Tornillo"
     codigo "9000000001"
   end

   factory :ubicacion do 
     codigo "0000000000"
     nombre "XXX - 000000 - 0"                     
     ciudad "XXX"
   end
end
