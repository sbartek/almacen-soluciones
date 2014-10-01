module PrecioHelper
  
  def precio_antonio(precio)
    (precio >= 200 ? precio.round : precio.round(2)) if precio
  end

end
