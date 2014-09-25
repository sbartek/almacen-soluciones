# -*- coding: utf-8 -*-
class SolicitudPdf< Prawn::Document
      
  def initialize(solicitud)
    super()
    @solicitud = solicitud
    define_grid(:columns => 12, :rows => 12, :gutter => 10)
    head

    grid([2,0],[2,8]).bounding_box do
      formatted_text [ { :text => "Proyecto: " , :styles => [:bold] },
                       { :text => "#{@solicitud.proyecto.to_s}" }]
      formatted_text [ { :text => "Solicitante: " , :styles => [:bold] },
                       { :text => "#{@solicitud.usuario.nombre}" }]
      formatted_text [ { :text => "Email: " , :styles => [:bold] },
                       { :text => "#{@solicitud.usuario.email}" }]
    end


    grid([3,0],[3,2]).bounding_box do
      formatted_text [ { :text => "Fecha", :styles => [:bold] }]
      formatted_text [ { :text => "#{@solicitud.fecha}"}]
    end

    grid([3,3],[3,5]).bounding_box do
      formatted_text [ { :text => "Fecha limite", :styles => [:bold] }]
      text "#{@solicitud.fecha_limite}"
    end

    grid([3,6],[3,8]).bounding_box do
      formatted_text [ { :text => "Prioridad", :styles => [:bold] }]
      prioridad_formated
    end


    grid([4,0],[7,11]).bounding_box do
      formatted_text [ { :text => "Descripción", :styles => [:bold] }]
      stroke_horizontal_rule
      text " "
      text "#{@solicitud.descripcion} "*600
      text " "
      stroke_horizontal_rule
    end

    if @solicitud.notas
      grid([8,0],[8,11]).bounding_box do
        formatted_text [ { :text => "Notas: ", 
                           :styles => [:bold],  
                           :color => "e20512" },
                         { :text => "#{@solicitud.notas} "*130, 
                           :color => "e20512" }]
      end
    end

    

    grid([11,0],[11,3]).bounding_box do
      text "Firma financiero responsable"
    end
    grid([11,8],[11,11]).bounding_box do
      if @solicitud.categoria == "O"
        text "Firma técnico responsable"
      elsif @solicitud.categoria == "A"
        text "Firma administrativo responsable"
      end
    end

  end

  def head
    grid([0,0],[0,1]).bounding_box do
      image "app/assets/images/Saema.opt.png", :scale => 0.1
    end
    
    grid([0,1],[0,11]).bounding_box do
      text self.titulo, :align => :center, :size => 24
    end
    
  end

  def titulo
    titulo = "Solicitud de #{@solicitud.categoria_full} Nº #{@solicitud.nr_ref}"
  end

  def prioridad_formated
    if @solicitud.prioridad == "U"
      formatted_text [ { :text => "#{@solicitud.prioridad_full}", 
                         :color => "e20512"}]
    else
      formatted_text [ { :text => "#{@solicitud.prioridad_full}", 
                         :color => "2ea04b"}]
    end
  end
end
