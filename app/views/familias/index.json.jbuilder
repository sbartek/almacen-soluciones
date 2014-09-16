json.array!(@familias) do |familia|
  json.extract! familia, :id, :nombre, :negocio_unidad_id
  json.url familia_url(familia, format: :json)
end
