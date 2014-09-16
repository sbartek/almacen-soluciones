json.array!(@subfamilias) do |subfamilia|
  json.extract! subfamilia, :id, :nombre, :familia_id
  json.url subfamilia_url(subfamilia, format: :json)
end
