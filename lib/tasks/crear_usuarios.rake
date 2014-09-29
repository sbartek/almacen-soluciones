# -*- coding: utf-8 -*-
desc "Crear usuarios"
task :crear_usuarios, [:filename] => :environment do
  usuarios = 
    [{nombre: "JMYus", email: "jmyus@soluciones-sl.com", 
       password: "000000", password_confirmation: "000000"},
     {nombre: "Alex Cisneros", email: "acisneros@soluciones-sl.com",
       password: "000000", password_confirmation: "000000"},
     {nombre: "Jorge Sánchez", email: "jsanchez@soluciones-sl.com",
       password: "000000", password_confirmation: "000000"},
    ]
  usuarios.each do |usuario|
    Usuario.create!(usuario)
  end
end
