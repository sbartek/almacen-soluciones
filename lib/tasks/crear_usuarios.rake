# -*- coding: undecided -*-
desc "Crear usuarios"
task :crear_usuarios, [:filename] => :environment do
  usuarios = 
    [{nombre: "JMYus", email: "jmyus@soluciones-sl.com"},
     {nombre: "Alex Cisneros", email: "acisneros@soluciones-sl.com"},
     {nombre: "Jorge Sánchez", email: "jsanchez@soluciones-sl.com"}    
    ]
  usuarios.each do |usuario|
    Usuario.create!(usuario)
  end
end
