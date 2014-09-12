json.array!(@ubicacions) do |ubicacion|
  json.extract! ubicacion, :id, :codigo, :nombre, :ciudad
  json.url ubicacion_url(ubicacion, format: :json)
end
