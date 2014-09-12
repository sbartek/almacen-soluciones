json.array!(@materials) do |material|
  json.extract! material, :id, :cantidad, :ficha_id, :ubicacion_id
  json.url material_url(material, format: :json)
end
