json.array!(@fichas) do |ficha|
  json.extract! ficha, :id, :nombre, :codigo
  json.url ficha_url(ficha, format: :json)
end
