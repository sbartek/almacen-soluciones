json.array!(@solicituds) do |solicitud|
  json.extract! solicitud, :id, :fecha, :proyecto_id, :usuario_id, :descripcion, :prioridad, :fecha_limite, :notas, :categoria
  json.url solicitud_url(solicitud, format: :json)
end
