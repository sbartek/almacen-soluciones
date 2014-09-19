json.array!(@proyectos) do |proyecto|
  json.extract! proyecto, :id, :nombre
  json.url proyecto_url(proyecto, format: :json)
end
