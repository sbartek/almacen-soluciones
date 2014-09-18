# language: es
Característica: Descripción de unidades de negocio, familias y subfamilias

  Como usuario,
  para encontrar fichas de materiales bajo el criterio dado por categoría,
  Quiero ver una lista de enlaces a detalles de materiales en ciertas categorías

  Antecedentes:
    Dado tabla de "unidades de negocio":
     | nombre  |
     | Agua    |
     | Energía |

    Dado tabla de "familias":
     | nombre        | negocio_unidad |
     | Solar termica | Agua           |
     | FV            | Energía        |
     | Fontanería    | Agua           |
    Dado tabla de "subfamilias":
     | nombre     | familia       |
     | Accesorios | Fontanería    |
     | Paneles    | FV            |
     | Captadores | Solar termica |
    Dado tabla de "fichas":
     | nombre                                         |     codigo | subfamilia |
     | Captador solar plano QRD CR10ALDP8 1900x1090mm | 0000000531 | Captadores |
     | Captador de estrellas                          | 0000666666 | Captadores |
     | Panel fotovoltaico 24V 240Wp                   | 0000000523 | Paneles    |
     | Tornillo abrazadera M10                        | 0000000350 | Accesorios |
    
  Escenario: Mostrar lista de todas las fichas de los materiales en una subfamilia 
    Cuando hago click en el enlace "Lista de subfamilias" de la pagina inicial
    Entonces aparezca una lista de enlaces de subfamilias que contiene una fila que contine "Accesorios", "Fontanería", "Agua"
    Cuando hago click en "Accesorios"
    Entonces aparece lista de "fichas" que contiene enlace "Tornillo abrazadera M10"

