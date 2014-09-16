json.array!(@negocio_unidads) do |negocio_unidad|
  json.extract! negocio_unidad, :id, :nombre
  json.url negocio_unidad_url(negocio_unidad, format: :json)
end
