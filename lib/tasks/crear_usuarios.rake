desc "Crear usuarios"
task :crear_usuarios, [:filename] => :environment do
  usuarios = 
    [{nombre: "Alex Cisneros",email: "acisne2@soluciones-sl.com"}]
  usuarios.each do |usuario|
    Usuario.create!(usuario)
  end
end
