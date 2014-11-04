# -*- coding: utf-8 -*-


namespace :db do
  desc "Crear usuarios"
  # task :crear_usuarios, [:filename] => :environment do
  #   usuarios = 
  #     [{nombre: "JMYus", email: "jmyus@soluciones-sl.com", 
  #        password: "000000", password_confirmation: "000000"},
  #      {nombre: "Alex Cisneros", email: "acisneros@soluciones-sl.com",
  #        password: "000000", password_confirmation: "000000"},
  #      {nombre: "Jorge Sánchez", email: "jsanchez@soluciones-sl.com",
  #        password: "000000", password_confirmation: "000000"},
  #     ]
  #   usuarios.each do |usuario|
  #     Usuario.create!(usuario)
  #   end
  # end

  task :crear_usuarios, [:filename] => :environment do
    usuarios = 
      [{nombre: "Carlos Gil", email: "cgil@soluciones-sl.com", 
         password: "000000", password_confirmation: "000000"},
       {nombre: "Amaia Echeverria", email: "aecheverria@soluciones-sl.com", 
         password: "000000", password_confirmation: "000000"}, 
       {nombre: "Peña Perez", email: "pperez@soluciones-sl.com", 
         password: "000000", password_confirmation: "000000"},
       {nombre: "Administración", email: "admon@soluciones-sl.com", 
         password: "000000", password_confirmation: "000000"},
       {nombre: "Luis Arantes", email: "larantes@soluciones-sl.com", 
         password: "000000", password_confirmation: "000000"},
       {nombre: "Administraçao", email: "secretaria@saemaprojectos.com", 
         password: "000000", password_confirmation: "000000"}
      ]
    usuarios.each do |usuario|
      Usuario.create!(usuario)
    end
  end
end
