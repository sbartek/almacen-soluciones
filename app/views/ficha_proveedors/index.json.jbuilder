json.array!(@ficha_proveedors) do |ficha_proveedor|
  json.extract! ficha_proveedor, :id, :nombre, :codigo, :precio, :ficha_id
  json.url ficha_proveedor_url(ficha_proveedor, format: :json)
end
